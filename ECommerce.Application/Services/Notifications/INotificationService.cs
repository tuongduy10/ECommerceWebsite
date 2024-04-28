using ECommerce.Application.Common;
using ECommerce.Data.Entities.ProductSchema;
using ECommerce.Data.Entities.UserSchema;
using ECommerce.Dtos.UserSchema;
using ECommerce.Utilities.Shared.Responses;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;

namespace ECommerce.Application.Services.Notifications
{
    public interface INotificationService
    {
        Task<Response<NotificationModel>> ReadAsync(int id = 0);
        Task<Response<string>> DeleteAsync(int id = 0);
        Task<List<NotificationModel>> GetAllByUserIdAsync(int userId = 0);
        Task<Notification> CreateCommentNotiAsync(Rate comment);
        Task<Notification> CreateLikeDislikeNotiAsync(Rate comment);
    }
}
