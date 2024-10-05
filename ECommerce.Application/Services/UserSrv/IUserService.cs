using ECommerce.Application.Common;
using ECommerce.Application.BaseServices.User.Dtos;
using ECommerce.Application.Services.UserSrv.Dtos;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using System.Security.Claims;
using ECommerce.Data.Entities.UserSchema;
using ECommerce.Utilities.Shared.Responses;

namespace ECommerce.Application.Services.UserSrv
{
    public interface IUserService
    {
        Task<Response<PageResult<UserGetModel>>> getUserPagingList(UserGetRequest request);
        Task<Response<List<UserGetModel>>> GetUsers(UserGetRequest request = null);
        Task<Response<UserGetModel>> GetUser(int userId);
        Task<ApiResponse> SetOnline(int userId = 0, bool isOnline = true);
        Task<Response<UserGetModel>> UpdateOnlineStatus(int _userId, bool _isOnline);
        Task<Response<UserGetModel>> UpdateOnlineHistory(int _userId);
        Task<Response<string>> ValidateUser(SignInRequest request);
        Task<Response<string>> SignUp(SignUpRequest request);
        Task<Response<string>> ConfirmRegister(string token);
        Task<Response<string>> ResetPassword(ResetPasswordRequest dto);
        Task<Response<string>> ForgetPassword(string userName);
        Task<Response<List<ShopModel>>> GetShops();
        Task<Response<UserShopModel>> UpdateUser(UserShopModel request);
        Task<Response<User>> UpdateUserStatus(Dtos.UserUpdateRequest request);
        Task<Response<User>> getCurrentUser();
        Task updateUserName();
        string getAccessToken();
        int getCurrentUserId();
        string getCurrentUserName();
        string getCurrentUserFullName();
        string GenerateToken(UserModel user);
        IEnumerable<Claim> TokenPrincipal(string token);
    }
}
