using ECommerce.Application.Common;
using ECommerce.Application.BaseServices.User.Dtos;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using ECommerce.Utilities.Constants;
using ECommerce.Application.Services.UserSrv.Dtos;
using ECommerce.Data.Entities.Common;
using ECommerce.Application.Enums;
using ECommerce.Data.Entities.UserSchema;
using ECommerce.Data.Entities.ProductSchema;
using ECommerce.Data.Abstractions;
using Microsoft.AspNetCore.Http;
using System.Security.Claims;
using ECommerce.Utilities.AppSettings;
using Microsoft.Extensions.Options;
using System.IdentityModel.Tokens.Jwt;
using Microsoft.IdentityModel.Tokens;
using ECommerce.Utilities.Shared.Responses;

namespace ECommerce.Application.Services.UserSrv
{
    public class UserService : IUserService
    {
        private readonly IUnitOfWork _uow;
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly AppSetting _appSetting;
        public UserService(IUnitOfWork uow, 
            IHttpContextAccessor httpContextAccessor,
            IOptionsMonitor<AppSetting> optionsMonitor)
        {
            _uow = uow;
            _httpContextAccessor = httpContextAccessor;
            _appSetting = optionsMonitor.CurrentValue;
        }
        public async Task<Response<PageResult<UserGetModel>>> getUserPagingList(UserGetRequest request)
        {
            try
            {
                var query = _uow.Repository<User>()
                    .QueryableAsync(x => request.userId == -1 || x.UserId == request.userId)
                    .Select(i => (UserGetModel)i);

                var record = await query.CountAsync();
                var data = await PaginatedList<UserGetModel>.CreateAsync(query, request.PageIndex, request.PageSize);
                var result = new PageResult<UserGetModel>()
                {
                    Items = data,
                    CurrentRecord = (request.PageIndex * request.PageSize) <= record ? (request.PageIndex * request.PageSize) : record,
                    TotalRecord = record,
                    CurrentPage = request.PageIndex,
                    TotalPage = (int)Math.Ceiling(record / (double)request.PageSize)
                };
                return new SuccessResponse<PageResult<UserGetModel>>(result);
            }
            catch (Exception error)
            {
                return new FailResponse<PageResult<UserGetModel>>(error.Message);
            }
        }
        public async Task<Response<List<UserGetModel>>> GetUsers(UserGetRequest request = null)
        {
            try
            {
                var list = (await _uow.Repository<User>()
                    .GetAllAsync())
                    .Select(i => new UserGetModel()
                    {
                        UserId = i.UserId,
                        UserFullName = i.UserFullName,
                        UserJoinDate = (DateTime)i.UserJoinDate,
                        UserMail = i.UserMail,
                        UserAddress = i.UserAddress,
                        UserWardCode = i.UserWardCode,
                        UserDistrictCode = i.UserDistrictCode,
                        UserCityCode = i.UserCityCode,
                        UserPhone = i.UserPhone,
                        isSystemAccount = i.IsSystemAccount == null ? false : (bool)i.IsSystemAccount,
                        Status = i.Status == null ? false : (bool)i.Status,
                        IsOnline = i.IsOnline == null ? false : (bool)i.IsOnline,
                        LastOnline = (DateTime)i.LastOnline
                    })
                    .ToList();

                if (request != null)
                {
                    if (request.all) list = list.ToList();
                    if (request.userId != 0) list = list.Where(i => i.UserId == request.userId).ToList();
                    if (request.isSystemAccount) list = list.Where(i => i.isSystemAccount == true).ToList();
                    if (request.isOnline) list = list.Where(i => i.IsOnline == true).ToList();
                    if (request.isOffline) list = list.Where(i => i.IsOnline == false).ToList();
                }

                var result = list.OrderByDescending(i => i.UserJoinDate).ToList();
                return new SuccessResponse<List<UserGetModel>>(result);
            }
            catch (Exception error)
            {
                return new FailResponse<List<UserGetModel>>("Lỗi: \n\n" + error.ToString());
            }
        }
        public async Task<Response<UserGetModel>> GetUser(int userId)
        {
            try
            {
                var user = await _uow.Repository<User>().FindByAsync(i => i.UserId == userId, "Shops");
                if (user == null) 
                    return new FailResponse<UserGetModel>("Không tìm thấy người dùng");

                var result = (UserGetModel)user;
                return new SuccessResponse<UserGetModel>("", result);
            }
            catch (Exception error)
            {
                return new FailResponse<UserGetModel>(error.ToString());
            }
        }
        public async Task<ApiResponse> SetOnline(int _userId = 0, bool _isOnline = true)
        {
            try
            {
                if(_userId != 0)
                {
                    var user = await _uow.Repository<User>().FindByAsync(item => item.UserId == _userId);
                    if (user != null)
                    {
                        user.IsOnline = _isOnline;
                        user.LastOnline = DateTime.Now;
                        _uow.Repository<User>().Update(user);
                        await _uow.SaveChangesAsync();
                        return new ApiSuccessResponse("");
                    }
                }
                return new ApiFailResponse("");
            }
            catch (Exception error)
            {
                return new ApiFailResponse(error.ToString());
            }
        }
        public async Task<Response<User>> UpdateUserStatus(Dtos.UserUpdateRequest request)
        {
            try
            {
                var user = await _uow.Repository<User>().FindByAsync(_ => _.UserId == request.id);
                if (user == null)
                    return new FailResponse<User>("Không tìm thấy người dùng");
                user.Status = request.status;
                _uow.Repository<User>().Update(user);
                await _uow.SaveChangesAsync();
                return new SuccessResponse<User>(user);
            }
            catch (Exception error)
            {
                return new FailResponse<User>(error.Message);
            }
        }
        public async Task<Response<UserGetModel>> UpdateOnlineStatus(int _userId, bool _isOnline)
        {
            try
            {
                if (_userId == 0) return new FailResponse<UserGetModel>("");

                var user = await _uow.Repository<User>().FindByAsync(item => item.UserId == _userId);
                if(user == null) return new FailResponse<UserGetModel>("Không tìm thấy người dùng");

                user.IsOnline = _isOnline;
                if(_isOnline == false) user.LastOnline = DateTime.Now;
                _uow.Repository<User>().Update(user);
                await _uow.SaveChangesAsync();

                var ressult = new UserGetModel()
                {
                    UserId = user.UserId,
                    IsOnline = user.IsOnline != null ? (bool)user.IsOnline : false,
                    LastOnlineLabel = ((DateTime)user.LastOnline).ToString(ConfigConstant.DATE_FORMAT) 
                };
                return new SuccessResponse<UserGetModel>("", ressult);
            }
            catch (Exception error)
            {
                return new FailResponse<UserGetModel>(error.ToString());
            }
        }
        public async Task<Response<UserGetModel>> UpdateOnlineHistory(int _userId)
        {
            try
            {
                if (_userId == 0) return new FailResponse<UserGetModel>("");

                var user = await _uow.Repository<User>().FindByAsync(item => item.UserId == _userId);
                if (user == null) return new FailResponse<UserGetModel>("Không tìm thấy người dùng");

                var history = await _uow.Repository<OnlineHistory>().FindByAsync(i => i.UserId == _userId && i.Duration == 0);
                if (history == null)
                {
                    // create new logic here
                    var newHistory = new OnlineHistory()
                    {
                        AccessDate = DateTime.Now,
                        UserId = _userId,
                        Duration = 0
                    };
                    await _uow.Repository<OnlineHistory>().AddAsync(newHistory);
                    await _uow.SaveChangesAsync();
                }
                else
                {
                    var totalMin = (DateTime.Now - (DateTime)user.LastOnline).TotalMinutes;
                    // update when over 3 minutes
                    if ((DateTime.Now - (DateTime)user.LastOnline).TotalSeconds >= 3)
                    {
                        int duration = Int32.Parse((DateTime.Now - (DateTime)history.AccessDate).TotalSeconds.ToString());
                        history.Duration = duration;
                        await _uow.SaveChangesAsync();
                    }
                }

                return new SuccessResponse<UserGetModel>("");
            }
            catch (Exception error)
            {
                return new FailResponse<UserGetModel>(error.ToString());
            }
        }
        public async Task<Response<UserModel>> ValidateUser(SignInRequest request)
        {
            try
            {
                if (string.IsNullOrEmpty(request.UserPhone) || string.IsNullOrEmpty(request.Password)) 
                    return new FailResponse<UserModel>("Thông tin không được để trống");

                var phonenumber = request.UserPhone;
                if (phonenumber.Contains("+84"))
                {
                    phonenumber = phonenumber.Replace("+84", "");
                    if (!phonenumber.StartsWith("0"))
                    {
                        phonenumber = "0" + phonenumber;
                    }
                }

                var result = await _uow.Repository<User>()
                    .FindByAsync(i => i.UserPhone == phonenumber && i.Password == request.Password);

                if (result == null) 
                    return new FailResponse<UserModel>("Mật khẩu hoặc tài khoản không đúng");
                if (result.Status == false) 
                    return new FailResponse<UserModel>("Tài khoản đã bị khóa");

                var user = new UserModel();
                user.id = result.UserId;
                user.fullName = result.UserFullName;
                user.phone = result.UserPhone;
                user.userName = result.UserName;

                return new SuccessResponse<UserModel>("Đăng nhập thành công", user);
            }
            catch(Exception error)
            {
                return new FailResponse<UserModel>("Đang xảy ra lỗi, vui lòng thử lại sau");
            }
        }
        public async Task<Response<List<ShopModel>>> GetShops()
        {
            try
            {
                var list = (await _uow.Repository<Shop>()
                    .GetByAsync(i => i.Status != 4 && i.Status != 2, _ => _.OrderByDescending(i => i.ShopId)))
                    .Select(i => new ShopModel()
                    {
                        id = i.ShopId,
                        name = i.ShopName,
                        phoneNumber = i.ShopPhoneNumber,
                        mail = i.ShopMail,
                        address = i.ShopAddress,
                        cityCode = i.ShopCityCode,
                        districtCode = i.ShopDistrictCode,
                        joinDate = (DateTime)i.ShopJoinDate,
                        wardCode = i.ShopWardCode,
                        status = (byte)i.Status,
                        user = i.User != null ? new UserModel
                        {
                            id = i.User.UserId,
                            fullName = i.User.UserFullName
                        } : null,
                    })
                    .ToList();
                return new SuccessResponse<List<ShopModel>>(list);
            }
            catch (Exception error)
            {
                return new FailResponse<List<ShopModel>>(error.Message);
            }
        }
        public async Task<Response<UserShopModel>> UpdateUser(UserShopModel request)
        {
            try
            {
                string phonenumber = null;
                // Phone validate
                if (!string.IsNullOrEmpty(request.phone))
                {
                    phonenumber = request.phone.Trim();
                    if (phonenumber.Contains("+84"))
                    {
                        phonenumber = phonenumber.Replace("+84", "");
                        if (!phonenumber.StartsWith("0"))
                            phonenumber = "0" + phonenumber;
                    }
                }

                if (string.IsNullOrEmpty(request.fullName))
                    return new FailResponse<UserShopModel>("Vui lòng nhập họ tên");
                if ((string.IsNullOrEmpty(request.password) || string.IsNullOrEmpty(request.rePassword)) && request.id == -1)
                    return new FailResponse<UserShopModel>("Vui lòng nhập mật khẩu");
                if (request.password != request.rePassword)
                    return new FailResponse<UserShopModel>("Mật khẩu không trùng");

                var hasSeller = await _uow.Repository<User>().AnyAsync(_ => 
                    _.UserPhone == phonenumber ||
                    _.UserMail == request.email.Trim());
                if (hasSeller && request.id == -1)
                    return new FailResponse<UserShopModel>("Số điện thoại hoặc Email đã tồn tại");

                var seller = await _uow.Repository<User>().FindByAsync(_ => _.UserId == request.id);
                if (seller == null)
                    seller = new Data.Entities.UserSchema.User();

                seller.UserMail = request.email.Trim();
                seller.UserCityCode = request.cityCode;
                seller.UserCityName = (await _uow.Repository<Province>().FindByAsync(_ => _.Code == request.cityCode))?.Name;
                seller.UserDistrictCode = request.districtCode;
                seller.UserDistrictName = (await _uow.Repository<District>().FindByAsync(_ => _.Code == request.districtCode))?.Name;
                seller.UserWardCode = request.wardCode;
                seller.UserWardName = (await _uow.Repository<Ward>().FindByAsync(_ => _.Code == request.wardCode))?.Name;
                seller.UserFullName = request.fullName.Trim();
                seller.UserAddress = request.address.Trim();
                seller.UserPhone = phonenumber;
                seller.IsOnline = false;
                seller.LastOnline = DateTime.Now;
                seller.IsSystemAccount = true;
                if (!string.IsNullOrEmpty(request.password) && !string.IsNullOrEmpty(request.rePassword))
                    seller.Password = request.password.Trim();

                if (request.id == -1) // Add
                    _uow.Repository<User>().AddAsync(seller).Wait();
                if (request.id > -1) // Update
                    _uow.Repository<User>().Update(seller);
                _uow.SaveChangesAsync().Wait();

                /** Role
                 * Remove all user roles then
                 * add new role from user id in request
                 **/
                var userRoles = await _uow.Repository<UserRole>().GetByAsync(_ => _.UserId == seller.UserId);
                if (userRoles.Count() > 0)
                {
                    _uow.Repository<UserRole>().Delete(userRoles);
                    _uow.SaveChangesAsync().Wait();
                }
                var newRole = new UserRole
                {
                    RoleId = (int)RoleEnum.Seller,
                    UserId = seller.UserId,
                };
                await _uow.Repository<UserRole>().AddAsync(newRole);
                await _uow.SaveChangesAsync();

                /**
                 * Shop
                 * Set null all shops has user id then 
                 * update new user id from request
                 **/
                var shopsByUser = await _uow.Repository<Shop>().GetByAsync(_ => _.UserId == seller.UserId);
                if (shopsByUser.Count() > 0)
                {
                    foreach (var shop in shopsByUser)
                    {
                        shop.UserId = null;
                    }
                    _uow.Repository<Shop>().Update(shopsByUser);
                    _uow.SaveChangesAsync().Wait();
                }
                if (request.shopIds.Count > 0)
                {
                    var shops = await _uow.Repository<Shop>().GetByAsync(_ => request.shopIds.Contains(_.ShopId));
                    if (shops.Count() > 0)
                    {
                        foreach (var shop in shops)
                        {
                            shop.UserId = seller.UserId;
                        }
                        _uow.Repository<Shop>().Update(shops);
                        _uow.SaveChangesAsync().Wait();
                    }
                }

                return new SuccessResponse<UserShopModel>();
            }
            catch (Exception exc)
            {
                return new FailResponse<UserShopModel>(exc.Message);
            }
        }

        public int getCurrentUserId() => Int32.Parse(getUserValue("id"));
        public string getCurrentUserFullName() => getUserValue("fullName");
        public string getCurrentUserName() => getUserValue("userName");
        private string getUserValue(string key)
        {
            string accessToken = getAccessToken();
            if (string.IsNullOrEmpty(accessToken))
                return null;
            var userClaims = DecodeToken(accessToken).Claims;
            return userClaims.FirstOrDefault(claim => claim.Type == key)?.Value;
        }
        public string getAccessToken()
        {
            var authorizationHeader = _httpContextAccessor.HttpContext.Request.Headers["Authorization"].ToString();
            if (string.IsNullOrEmpty(authorizationHeader) || !authorizationHeader.StartsWith("Bearer "))
                return null;
            var token = authorizationHeader.Substring("Bearer ".Length);
            return token;
        }
        public string GenerateToken(UserModel user)
        {
            var jwtTokenHandler = new JwtSecurityTokenHandler();
            var secretKeyBytes = Encoding.UTF8.GetBytes(_appSetting.SecretKey);
            var description = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(new[]
                {
                    new Claim("id", user.id.ToString()),
                    new Claim("tokenId", Guid.NewGuid().ToString()),
                    new Claim("fullName", user.fullName),
                    new Claim("phone", user.phone),
                    new Claim("userName", user.userName),
                }),
                Expires = DateTime.UtcNow.AddHours(4),
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(secretKeyBytes), SecurityAlgorithms.HmacSha256Signature)
            };
            var createToken = jwtTokenHandler.CreateToken(description);
            var writeToken = jwtTokenHandler.WriteToken(createToken);

            return writeToken;
        }
        public ClaimsPrincipal DecodeToken(string token)
        {
            var secretKeyBytes = Encoding.UTF8.GetBytes(_appSetting.SecretKey);
            var jwtTokenHandler = new JwtSecurityTokenHandler()
                .ValidateToken(token, new TokenValidationParameters()
                {
                    IssuerSigningKey = new SymmetricSecurityKey(secretKeyBytes),
                    ValidateIssuer = false,
                    ValidateAudience = false,
                }, out SecurityToken secToken);
            return jwtTokenHandler;
        }
    
        private string generateUserName(string fullName, string phoneNumber)
        {
            string lowercaseAlphabets = string.Join("", Enumerable.Range('a', 'z' - 'a' + 1).Select(c => (char)c));

            List<char> distinctConsonants = new List<char>();
            for (int i = 0; i < fullName.Length; i++)
            {
                char charAtIdx = fullName[i];
                if (lowercaseAlphabets.IndexOf(char.ToLower(charAtIdx)) >= 0)
                    distinctConsonants.Add(charAtIdx.ToString().ToLower()[0]);
            }
            return string.Join("", distinctConsonants) + phoneNumber.Substring(phoneNumber.Length - 4, 4);
        }
    }
}
