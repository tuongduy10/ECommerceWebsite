﻿using ECommerce.Application.Common;
using ECommerce.Application.Repositories.Notification.Dtos;
using ECommerce.Application.BaseServices.Rate.Dtos;
using ECommerce.Application.BaseServices.Rate.Models;
using ECommerce.Application.BaseServices.User.Enums;
using ECommerce.Application.Services.UserSrv.Dtos;
using ECommerce.Data.Context;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ECommerce.Data.Entities.ProductSchema;

namespace ECommerce.Application.Repositories.Notification
{
    public class NotificationRepository : RepositoryBase<Data.Entities.UserSchema.Notification>, INotificationRepository
    {
        public NotificationRepository(ECommerceContext DbContext):base(DbContext) { }
        public async Task<Data.Entities.UserSchema.Notification> CreateCommentNotiAsync(Rate comment)
        {
            if (comment.RepliedId == null)
                return null;

            var notification = await GetAsyncWhere(item => item.InfoId == comment.RateId);
            if (notification == null)
            {
                // create new
                var newNotification = new Data.Entities.UserSchema.Notification()
                {
                    TextContent = comment.Comment,
                    CreateDate = DateTime.Now,
                    IsRead = false,
                    ReceiverId = comment.UserRepliedId,
                    SenderId = comment.UserId,
                    JsLink = $"/Product/ProductDetail?ProductId={comment.ProductId}&isScrolledTo=true&commentId={comment.RateId}",
                    TypeId = (int?)Enums.NotificationType.Comment,
                    InfoId = comment.RateId
                };
                await AddAsync(newNotification);
                await SaveChangesAsync();
                return newNotification;
            }
            else
            {
                // update
                notification.CreateDate = DateTime.Now;
                notification.TextContent = comment.Comment;
                notification.IsRead = false;
                notification.TypeId = (int?)Enums.NotificationType.UpdateComment;
                Update(notification);
                await SaveChangesAsync();
                return notification;
            }
        }
        public async Task<Data.Entities.UserSchema.Notification> CreateLikeDislikeNotiAsync(Rate comment)
        {
            var notification = await GetAsyncWhere(item => item.InfoId == comment.RateId && item.TypeId == (int)Enums.NotificationType.Like);
            var userNames = await _DbContext.Interests
                        .Where(item => item.RateId == comment.RateId && item.Liked == true)
                        .Select(item => item.User.UserFullName)
                        .ToListAsync();

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
                var newNotification = new Data.Entities.UserSchema.Notification()
                {
                    TextContent = textConent,
                    ReceiverId = comment.UserId,
                    SenderId = null,
                    JsLink = $"/Product/ProductDetail?ProductId={comment.ProductId}&isScrolledTo=true&commentId={comment.RateId}",
                    TypeId = (int?)Enums.NotificationType.Like,
                    CreateDate = DateTime.Now,
                    InfoId = comment.RateId,
                    IsRead = false,
                };
                await AddAsync(newNotification);
                await SaveChangesAsync();
                return newNotification;
            }
            else
            {
                var likeCount = comment.Interests.Where(item => item.Liked == true).Count();
                if (likeCount == 0 || textConent == "")
                {
                    // remove if it has no content or like count return to 0
                    await RemoveAsyncWhere(item => item.InfoId == comment.RateId && item.TypeId == (int?)Enums.NotificationType.Like);
                    await SaveChangesAsync();
                    return null;
                }
                else
                {
                    // update
                    notification.CreateDate = DateTime.Now;
                    notification.TextContent = textConent;
                    notification.IsRead = false;
                    Update(notification);
                    await SaveChangesAsync();
                    return notification;
                }
            }
        }
        public async Task<Data.Entities.UserSchema.Notification> CreateMessageHistoryAsync(MessageModel message)
        {
            // add new
            var newNotification = new Data.Entities.UserSchema.Notification()
            {
                TextContent = message.Message,
                ReceiverId = message.ToUserId,
                SenderId = message.FromUserId,
                TypeId = (int?)Enums.NotificationType.NewMessage,
                CreateDate = DateTime.Now,
                IsRead = false,
            };
            await AddAsync(newNotification);
            await SaveChangesAsync();
            return newNotification;
        }
        public async Task<NotificationModel> FindByIdAsync(int id = 0)
        {
            var model = await Query(item => item.Id == id)
                .Select(item => new NotificationModel
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
                    TypeCode = item.Type.TypeCode
                })
                .FirstOrDefaultAsync();
            return model;
        }
        public async Task<bool> RemoveByIdAsync(int id = 0)
        {
            var entity = await GetAsyncWhere(item => item.Id == id);
            Remove(entity);
            return true;
        }
    }
}

