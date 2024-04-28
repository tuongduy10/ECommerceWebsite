using ECommerce.Application.Common;
using ECommerce.Utilities.Constants;
using ECommerce.Utilities.Helpers;
using ECommerce.Application.Services.Chat.Dtos;
using ECommerce.Application.Services.UserSrv;
using ECommerce.Data.Context;
using ECommerce.Data.Entities.UserSchema;
using Microsoft.EntityFrameworkCore;
using Microsoft.VisualBasic;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ECommerce.Data.Abstractions;
using ECommerce.Utilities.Shared.Responses;

namespace ECommerce.Application.Services.Chat
{
    public class ChatService : IChatService
    {
        private readonly IUnitOfWork _uow;
        public ChatService(IUnitOfWork uow)
        {
            _uow = uow;
        }
        public async Task<Response<MessageModel>> SendMessage(MessageModel request)
        {
            try
            {
                if (String.IsNullOrEmpty(request.Message))
                    return new FailResponse<MessageModel>("Nội dung không được để trống");
                var fromUserInfo = await _uow.Repository<User>().FindByAsync(user => user.UserPhone == request.FromPhoneNumber);

                var newMessageHistory = new MessageHistory();
                newMessageHistory.Message = request.Message.Trim();
                newMessageHistory.CreateDate = DateTime.Now;
                newMessageHistory.Status = StatusConstant.MSG_UNREAD;
                newMessageHistory.ToPhoneNumber = request.ToPhoneNumber;
                newMessageHistory.FromName = fromUserInfo != null ? fromUserInfo.UserFullName : "";
                newMessageHistory.FromPhoneNumber = fromUserInfo != null ? fromUserInfo.UserPhone : "";
                newMessageHistory.Type = request.Type;
                if(!String.IsNullOrEmpty(request.Attachment))
                    newMessageHistory.Attachment = request.Attachment.Trim();

                await _uow.Repository<MessageHistory>().AddAsync(newMessageHistory);
                await _uow.SaveChangesAsync();

                // response model
                var resModel = new MessageModel();
                resModel.Message = newMessageHistory.Message;
                resModel.CreateDate = newMessageHistory.CreateDate;
                resModel.ToPhoneNumber = newMessageHistory.ToPhoneNumber;
                resModel.FromPhoneNumber = newMessageHistory.FromPhoneNumber;
                resModel.FromName = newMessageHistory.FromName;
                resModel.Attachment = newMessageHistory.Attachment;
                resModel.Type = newMessageHistory.Type;
                resModel.Status = newMessageHistory.Status;

                return new SuccessResponse<MessageModel>("success", resModel);
            }
            catch (Exception error)
            {
                return new FailResponse<MessageModel>(error.ToString());
            }
        }
        public async Task<Response<MessageModel>> SendUnAuthMessage(MessageModel request)
        {
            try
            {
                if (String.IsNullOrEmpty(request.FromName))
                    return new FailResponse<MessageModel>("Tên không được để trống");
                if (String.IsNullOrEmpty(request.FromPhoneNumber))
                    return new FailResponse<MessageModel>("Số điện thoại không được để trống");
                if (String.IsNullOrEmpty(request.Message))
                    return new FailResponse<MessageModel>("Nội dung không được để trống");

                if (request.FromPhoneNumber.Contains("+84"))
                {
                    request.FromPhoneNumber = request.FromPhoneNumber.Replace("+84", "");
                    if (!request.FromPhoneNumber.StartsWith("0"))
                    {
                        request.FromPhoneNumber = "0" + request.FromPhoneNumber;
                    }
                }
                var userInfo = await _uow.Repository<User>().FindByAsync(i => i.UserPhone == request.FromPhoneNumber);
                if (userInfo != null)
                {
                    request.FromName = userInfo.UserFullName;
                } 
                else
                {
                    var userMsg = await _uow.Repository<MessageHistory>().FindByAsync(i => i.FromPhoneNumber == request.FromPhoneNumber);
                    if (userMsg != null)
                    {
                        request.FromName = userMsg.FromName;
                    }
                }

                var newMessageHistory = new MessageHistory();
                newMessageHistory.Message = request.Message.Trim();
                newMessageHistory.CreateDate = DateTime.Now;
                newMessageHistory.ToPhoneNumber = request.ToPhoneNumber;
                newMessageHistory.FromName = request.FromName.Trim();
                newMessageHistory.FromPhoneNumber = request.FromPhoneNumber.Trim();
                newMessageHistory.Type = TypeConstant.MSG_FROM_CLIENT;
                newMessageHistory.Status = StatusConstant.MSG_UNREAD;

                await _uow.Repository<MessageHistory>().AddAsync(newMessageHistory);
                await _uow.SaveChangesAsync();

                // response model
                var resModel = new MessageModel();
                resModel.Message = newMessageHistory.Message;
                resModel.CreateDate = newMessageHistory.CreateDate;
                resModel.ToPhoneNumber = newMessageHistory.ToPhoneNumber;
                resModel.FromName = newMessageHistory.FromName;
                resModel.FromPhoneNumber = newMessageHistory.FromPhoneNumber;
                resModel.Attachment = newMessageHistory.Attachment;
                resModel.Type = newMessageHistory.Type;
                resModel.Status = newMessageHistory.Status;

                return new SuccessResponse<MessageModel>("", resModel);
            }
            catch (Exception error)
            {
                return new FailResponse<MessageModel>(error.ToString());
            }
        }
        public async Task<Response<List<UserMessage>>> GetUserMessagesAsync(int userId = 0)
        {
            try
            {
                var list = (await _uow.Repository<User>().GetByAsync(_ => _.UserId == userId))
                    .Select(i => new UserMessage() { 
                        UserId = i.UserId,
                        FromName = i.UserFullName,
                        FromPhoneNumber = i.UserPhone,
                    })
                    .ToList();
                foreach (var user in list)
                {
                    user.MessageList = (await _uow.Repository<MessageHistory>()
                            .GetByAsync(msg => msg.FromPhoneNumber == user.FromPhoneNumber))
                            .Select(msg => new MessageModel()
                            {
                                Id = msg.Id,
                                Message = msg.Message,
                                Attachment = msg.Attachment,
                                CreateDate = msg.CreateDate,
                                ToPhoneNumber = msg.ToPhoneNumber,
                                Status = msg.Status
                            })
                            .ToList();
                }
                list = list.Where(item => item.MessageList.Count > 0).ToList();
                return new SuccessResponse<List<UserMessage>>("", list);
            }
            catch (Exception error)
            {
                return new FailResponse<List<UserMessage>>(error.ToString());
            }
        }
        public async Task<Response<List<UserMessage>>> GetAllUserMessagesAsync(int sellerId = 0)
        {
            try
            {
                var groupMsg = from msg in _uow.Repository<MessageHistory>().QueryableAsync()
                               group msg by new
                               {
                                   msg.FromName,
                                   msg.FromPhoneNumber
                               };
                    
                var list = new List<UserMessage>();
                foreach (var msg in groupMsg)
                {
                    var messageList = msg
                        .Select(i => new MessageModel() 
                        {
                            ToPhoneNumber = i.ToPhoneNumber,
                            CreateDate = i.CreateDate,
                            CreateDateLabel = ((DateTime)i.CreateDate).ToString(ConfigConstant.DATE_FORMAT),
                            Message = i.Message,
                            Status = i.Status,
                            Type = i.Type,
                            Attachment = i.Attachment
                        })
                        .ToList();
                    list.Add(new UserMessage() { 
                        FromName = msg.Key.FromName,
                        FromPhoneNumber = msg.Key.FromPhoneNumber,
                        MessageList = messageList,
                        LatestMessage = messageList.Count > 0 ? messageList[messageList.Count - 1] : null
                    });
                }
                list = list.OrderByDescending(i => i.LatestMessage.CreateDate).ToList();
                return new SuccessResponse<List<UserMessage>>("", list);
            }
            catch (Exception error)
            {
                return new FailResponse<List<UserMessage>>(error.ToString());
            }
        }
        public async Task<Response<List<UserMessage>>> GetUserList()
        {
            try
            {
                var groupMsg = from msg in _uow.Repository<MessageHistory>().QueryableAsync()
                               where msg.Type == TypeConstant.MSG_FROM_CLIENT
                               group msg by new
                               {
                                   msg.FromName,
                                   msg.FromPhoneNumber
                               };

                var list = new List<UserMessage>();
                foreach (var msg in groupMsg)
                {
                    var messages = (await _uow.Repository<MessageHistory>()
                        .GetByAsync(
                            item =>
                                item.FromPhoneNumber == msg.Key.FromPhoneNumber && 
                                item.ToPhoneNumber == null))
                            .Select(i => new MessageModel()
                            {
                                Message = i.Message,
                                CreateDate = i.CreateDate,
                                CreateDateLabel = ((DateTime)i.CreateDate).ToString(ConfigConstant.DATE_FORMAT),
                                Status = i.Status
                            })
                            .ToList();
                    list.Add(new UserMessage()
                    {
                        FromName = msg.Key.FromName,
                        FromPhoneNumber = msg.Key.FromPhoneNumber,
                        LatestMessage = messages[messages.Count() - 1]
                    });
                }
                list = list.OrderByDescending(i => i.LatestMessage.CreateDate).ToList();
                return new SuccessResponse<List<UserMessage>>("", list);
            }
            catch (Exception error)
            {
                return new FailResponse<List<UserMessage>>(error.ToString());
            }
        }
        public async Task<Response<List<MessageModel>>> GetMessages(MessageGetModel request)
        {
            try
            {
                var list = (await _uow.Repository<MessageHistory>()
                    .GetByAsync(item => 
                        (item.FromPhoneNumber == request.fromPhoneNumber && item.ToPhoneNumber == null) ||
                        item.ToPhoneNumber == request.fromPhoneNumber, _ => _.OrderByDescending(i => i.CreateDate)))
                    .Select(msg => new MessageModel() {
                        Id = msg.Id,
                        Attachment = msg.Attachment,
                        CreateDate = msg.CreateDate,
                        CreateDateLabel = ((DateTime)msg.CreateDate).ToString(ConfigConstant.DATE_FORMAT),
                        Message = msg.Message,
                        FromName = msg.FromName,
                        FromPhoneNumber = msg.FromPhoneNumber,
                        ToPhoneNumber = msg.ToPhoneNumber,
                        Type = msg.Type,
                        Status = msg.Status,
                    })
                    .ToList();

                if (list != null && list.Count() > 0)
                {
                    // read the messages
                    await ReadMessageAsync(list);
                }
                
                return new SuccessResponse<List<MessageModel>>(list);
            }
            catch (Exception error)
            {
                return new FailResponse<List<MessageModel>>(error.ToString());
            }
        }
        private async Task ReadMessageAsync(List<MessageModel> list)
        {
            // read the messages
            var unReadMsgIds = list
                .Where(i => i.Status == StatusConstant.MSG_UNREAD)
                .Select(i => i.Id)
                .ToList();
            if (unReadMsgIds.Count() > 0)
            {
                var unReadMsg = await _uow.Repository<MessageHistory>().GetByAsync(i => unReadMsgIds.Contains(i.Id));
                foreach (var msg in unReadMsg)
                {
                    msg.Status = StatusConstant.MSG_READ;
                }
                _uow.Repository<MessageHistory>().Update(unReadMsg);
                await _uow.SaveChangesAsync();
            }
        }
        public async Task<Response<MessageModel>> SaveOfflineMessageAsync(OfflineMessage request)
        {
            try
            {
                if (String.IsNullOrEmpty(request.FromPhoneNumber))
                    return new FailResponse<MessageModel>("Số điện thoại không được để trống");
                if (String.IsNullOrEmpty(request.FromName))
                    return new FailResponse<MessageModel>("Tên không được để trống");
                if (String.IsNullOrEmpty(request.Message))
                    return new FailResponse<MessageModel>("Nội dung không được để trống");
                if (request.FromPhoneNumber.Count() > 10)
                    return new FailResponse<MessageModel>("Số điện thoại không hợp lệ");
                if (request.FromName.Count() > 100)
                    return new FailResponse<MessageModel>("Tên không hợp lệ");
                if (request.Message.Count() > 500)
                    return new FailResponse<MessageModel>("Nội dung không được vượt quá 500 ký tự");


                var messageModel = new MessageHistory();
                messageModel.Message = request.Message.Trim();
                messageModel.FromName = request.FromName.Trim();
                messageModel.FromPhoneNumber = request.FromPhoneNumber.Trim();
                await _uow.Repository<MessageHistory>().AddAsync(messageModel);
                await _uow.SaveChangesAsync();


                return new SuccessResponse<MessageModel>("success");
            }
            catch (Exception error)
            {
                return new FailResponse<MessageModel>(error.ToString());
            }
        }
    }
}
