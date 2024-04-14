using ECommerce.Application.Common;
using ECommerce.Application.Repositories.Notification.Dtos;
using ECommerce.Application.BaseServices.Rate.Dtos;
using ECommerce.Application.BaseServices.Rate.Models;
using ECommerce.Application.Services.User.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ECommerce.Data.Entities.ProductSchema;

namespace ECommerce.Application.Repositories.Notification
{
    public interface INotificationRepository : IRepositoryBase<Data.Entities.UserSchema.Notification>
    {
        Task<bool> RemoveByIdAsync(int id = 0);
        Task<NotificationModel> FindByIdAsync(int id = 0);
        Task<Data.Entities.UserSchema.Notification> CreateCommentNotiAsync(Rate comment);
        Task<Data.Entities.UserSchema.Notification> CreateLikeDislikeNotiAsync(Rate comment);
        Task<Data.Entities.UserSchema.Notification> CreateMessageHistoryAsync(MessageModel message);
    }
}
