using ECommerce.Application.Common;
using ECommerce.Application.BaseServices.User.Enums;
using ECommerce.Data.Context;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ECommerce.Data.Abstractions;
using ECommerce.Data.Entities.UserSchema;
using ECommerce.Data.Entities.ProductSchema;
using ECommerce.Utilities.Constants;
using ECommerce.Dtos.UserSchema;

namespace ECommerce.Application.Services.Notifications
{
    public class NotificationService : INotificationService
    {
        private readonly IUnitOfWork _uow;
        public NotificationService(IUnitOfWork uow)
        {
            _uow = uow;
        }
        public async Task<List<NotificationModel>> GetAllByUserIdAsync(int userId = 0)
        {
            var list = (await _uow.Repository<Notification>()
                .GetByAsync(
                    item => item.ReceiverId == userId,
                    _ => _.OrderByDescending(i => i.CreateDate)))
                .Select(item => new NotificationModel
                {
                    Id = item.Id,
                    TextContent = item.TextContent,
                    ReceiverId = item.ReceiverId == null ? 0 : (int)item.ReceiverId,
                    SenderId = item.SenderId == null ? 0 : (int)item.SenderId,
                    JsLink = item.JsLink,
                    CreateDate = (DateTime)item.CreateDate,
                    IsRead = (bool)item.IsRead,
                    ReceiverIsAmin = item.Receiver == null ? false  : item.Receiver.UserRoles.Select(role => role.Role.RoleName).FirstOrDefault().Contains(RoleName.Admin),
                    SenderIsAdmin = item.Sender == null ? false : item.Sender.UserRoles.Select(role => role.Role.RoleName).FirstOrDefault().Contains(RoleName.Admin),
                    SenderName = item.Sender == null ? "" : item.Sender.UserFullName,
                    TypeCode = item.TypeCode
                })
                .ToList();
            return list;
        }
        public async Task<Response<NotificationModel>> ReadAsync(int id = 0)
        {
            try
            {
                var item = await _uow.Repository<Notification>().FindByAsync(item => item.Id == id);
                item.IsRead = true;
                _uow.Repository<Notification>().Update(item);
                await _uow.SaveChangesAsync();

                var resData = new NotificationModel
                {
                    Id = item.Id,
                    TextContent = item.TextContent,
                    ReceiverId = item.ReceiverId == null ? 0 : (int)item.ReceiverId,
                    SenderId = item.SenderId == null ? 0 : (int)item.SenderId,
                    JsLink = item.JsLink,
                    CreateDate = (DateTime)item.CreateDate,
                    IsRead = (bool)item.IsRead,
                    ReceiverIsAmin = item.Receiver == null ? false : item.Receiver.UserRoles.Select(role => role.Role.RoleName).FirstOrDefault().Contains(RoleName.Admin),
                    SenderIsAdmin = item.Sender == null ? false : item.Sender.UserRoles.Select(role => role.Role.RoleName).FirstOrDefault().Contains(RoleName.Admin),
                    SenderName = item.Sender == null ? "" : item.Sender.UserFullName,
                    TypeCode = item.TypeCode
                };

                return new SuccessResponse<NotificationModel>("", resData);
            }
            catch (Exception error)
            {
                return new FailResponse<NotificationModel>("Lỗi \n\n" + error.ToString());
            }
        }
        public async Task<Response<string>> DeleteAsync(int id = 0)
        {
            try
            {
                var entity = await _uow.Repository<Notification>().FindByAsync(item => item.Id == id);
                _uow.Repository<Notification>().Delete(entity);
                await _uow.SaveChangesAsync();

                return new SuccessResponse<string>("Xóa thành công");
            }
            catch (Exception error)
            {
                return new FailResponse<string>("Lỗi \n\n" + error.ToString());
            }
        }
        public async Task<Notification> CreateCommentNotiAsync(Rate comment)
        {
            if (comment.RepliedId == null)
                return null;

            var notification = await _uow.Repository<Notification>().FindByAsync(item => item.InfoId == comment.RateId);
            if (notification == null)
            {
                // create new
                var newNotification = new Notification()
                {
                    TextContent = comment.Comment,
                    CreateDate = DateTime.Now,
                    IsRead = false,
                    ReceiverId = comment.UserRepliedId,
                    SenderId = comment.UserId,
                    JsLink = $"/Product/ProductDetail?ProductId={comment.ProductId}&isScrolledTo=true&commentId={comment.RateId}",
                    TypeCode = NotificationConstant.COMMNENT,
                    InfoId = comment.RateId
                };
                await _uow.Repository<Notification>().AddAsync(newNotification);
                await _uow.SaveChangesAsync();
                return newNotification;
            }
            else
            {
                // update
                notification.CreateDate = DateTime.Now;
                notification.TextContent = comment.Comment;
                notification.IsRead = false;
                notification.TypeCode = NotificationConstant.UPDATE_COMMENT;
                _uow.Repository<Notification>().Update(notification);
                await _uow.SaveChangesAsync();
                return notification;
            }
        }
        public async Task<Notification> CreateLikeDislikeNotiAsync(Rate comment)
        {
            var notification = await _uow.Repository<Notification>().FindByAsync(item => item.InfoId == comment.RateId && item.TypeCode == NotificationConstant.LIKE);
            var userNames = (await _uow.Repository<Interest>()
                        .GetByAsync(item => item.RateId == comment.RateId && item.Liked == true))
                        .Select(item => item.User.UserFullName)
                        .ToList();

            var textConent = "";
            if (userNames != null && userNames.Count == 1)
                textConent = $"{userNames[0]} đã thích bình luận của bạn";
            if (userNames != null && userNames.Count > 1 && userNames.Count <= 4)
                textConent = $"{String.Join(", ", userNames.SkipLast(1))} và {userNames.TakeLast(1).First()} đã thích bình luận của bạn";
            if (userNames != null && userNames.Count > 4)
                textConent = $"{String.Join(", ", userNames.Take(4))} và {userNames.Count - 4} người khác đã thích bình luận của bạn";

            if (notification == null && textConent != "")
            {
                // add new
                var newNotification = new Notification()
                {
                    TextContent = textConent,
                    ReceiverId = comment.UserId,
                    SenderId = null,
                    JsLink = $"/Product/ProductDetail?ProductId={comment.ProductId}&isScrolledTo=true&commentId={comment.RateId}",
                    TypeCode = NotificationConstant.LIKE,
                    CreateDate = DateTime.Now,
                    InfoId = comment.RateId,
                    IsRead = false,
                };
                await _uow.Repository<Notification>().AddAsync(newNotification);
                await _uow.SaveChangesAsync();
                return newNotification;
            }
            else
            {
                var likeCount = comment.Interests.Where(item => item.Liked == true).Count();
                if (likeCount == 0 || textConent == "")
                {
                    // remove if it has no content or like count return to 0
                    var entities = await _uow.Repository<Notification>().GetByAsync(item => item.InfoId == comment.RateId && item.TypeCode == NotificationConstant.LIKE);
                    _uow.Repository<Notification>().Delete(entities);
                    await _uow.SaveChangesAsync();
                    return null;
                }
                else
                {
                    // update
                    notification.CreateDate = DateTime.Now;
                    notification.TextContent = textConent;
                    notification.IsRead = false;
                    _uow.Repository<Notification>().Update(notification);
                    await _uow.SaveChangesAsync();
                    return notification;
                }
            }
        }
    }
}
