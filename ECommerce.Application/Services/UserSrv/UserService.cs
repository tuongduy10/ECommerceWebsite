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
using ECommerce.Application.ExternalServices.Emails;
using ECommerce.Application.ExternalServices.Emails.Dtos;
using System.IO;
using System.Text.RegularExpressions;
using Newtonsoft.Json.Linq;

namespace ECommerce.Application.Services.UserSrv
{
    public class UserService : IUserService
    {
        private readonly IUnitOfWork _uow;
        private readonly IHttpContextAccessor _httpContextAccessor;
        private readonly AppSetting _appSetting;
        private readonly IEmailService _emailService;
        public UserService(IUnitOfWork uow, 
            IHttpContextAccessor httpContextAccessor,
            IOptionsMonitor<AppSetting> optionsMonitor,
            IEmailService emailService)
        {
            _uow = uow;
            _httpContextAccessor = httpContextAccessor;
            _appSetting = optionsMonitor.CurrentValue;
            _emailService = emailService;
        }
        public async Task<Response<PageResult<UserGetModel>>> getUserPagingList(UserGetRequest request)
        {
            try
            {
                string userName = getCurrentUserName();
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
        public async Task<Response<string>> ValidateUser(SignInRequest request)
        {
            if (string.IsNullOrEmpty(request.UserPhone) || string.IsNullOrEmpty(request.Password))
                return new FailResponse<string>("Thông tin không được để trống");

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
                .FindByAsync(i => i.UserPhone == phonenumber && i.Password == request.Password, "UserRoles.Role");

            if (result == null)
                return new FailResponse<string>("Mật khẩu hoặc tài khoản không đúng");
            if (result.Status == false)
                return new FailResponse<string>("Tài khoản đã bị khóa");
            if (result.IsActived == false)
            {
                return new FailResponse<string>("Tài khoản chưa được kích hoạt");
            }

            var permissions = await _uow.Repository<RoleToPermission>()
                .GetByAsync(
                    _ => result.UserRoles.Select(r => r.Role.RoleId).Contains(_.RoleId), null, 
                    "Permission");

            var user = new UserModel();
            user.id = result.UserId;
            user.fullName = result.UserFullName;
            user.phone = result.UserPhone;
            user.userName = result.UserName;
            user.roles = result.UserRoles.Select(_ => _.Role.RoleName).ToList();
            user.permissions = permissions.Select(_ => _.Permission.Name).ToList();
            string token = GenerateToken(user);

            return new SuccessResponse<string>("Đăng nhập thành công", token);
        }
        public async Task<Response<string>> SignUp(SignUpRequest request)
        {
            var transaction = await _uow.BeginTransactionAsync();
            try
            {
                if (string.IsNullOrEmpty(request.UserPhone)) return new FailResponse<string>("Số điện thoại không được để trống");
                if (request.UserPhone.Contains("+84"))
                {
                    request.UserPhone = request.UserPhone.Replace("+84", "");
                    if (!request.UserPhone.StartsWith("0"))
                    {
                        request.UserPhone = "0" + request.UserPhone;
                    }
                }

                if (string.IsNullOrEmpty(request.UserFullName)) return new FailResponse<string>("Vui lòng nhập họ tên");
                if (string.IsNullOrEmpty(request.Password) || string.IsNullOrEmpty(request.RePassword)) return new FailResponse<string>("Vui lòng nhập mật khẩu");
                if (request.Password != request.RePassword) return new FailResponse<string>("Mật khẩu không trùng");

                if (!IsValidEmail(request.UserMail)) return new FailResponse<string>("Mail không hợp lệ");
                var checkMail = (await _uow.Repository<User>().GetByAsync(i => i.UserMail == request.UserMail)).FirstOrDefault();
                if (checkMail != null) return new FailResponse<string>("Mail đã tồn tại");

                var checkPhone = (await _uow.Repository<User>().GetByAsync(i => i.UserPhone == request.UserPhone)).FirstOrDefault();
                if (checkPhone != null) return new FailResponse<string>("Số điện thoại đã tồn tại");

                User user = new User();
                user.UserMail = !string.IsNullOrEmpty(request.UserMail) ? request.UserMail.Trim() : null;
                //user.UserJoinDate = DateTime.Now;
                user.UserFullName = !string.IsNullOrEmpty(request.UserFullName) ? request.UserFullName.Trim() : null;
                user.UserPhone = !string.IsNullOrEmpty(request.UserPhone) ? request.UserPhone.Trim() : null;
                user.UserAddress = !string.IsNullOrEmpty(request.UserAddress) ? request.UserAddress.Trim() : null;
                user.UserDistrictCode = !string.IsNullOrEmpty(request.UserDistrictCode) ? request.UserDistrictCode.Trim() : null;
                user.UserCityCode = !string.IsNullOrEmpty(request.UserCityCode) ? request.UserCityCode.Trim() : null;
                user.UserWardCode = !string.IsNullOrEmpty(request.UserWardCode) ? request.UserWardCode.Trim() : null;
                user.Password = !string.IsNullOrEmpty(request.RePassword) ? request.RePassword.Trim() : null;
                user.UserName = generateUserName(user.UserFullName.Trim(), user.UserPhone);
                user.Status = true;
                user.IsActived = false;
                user.IsSystemAccount = request.isSystemAccount;
                await _uow.Repository<User>().AddAsync(user);
                await _uow.SaveChangesAsync();

                // UserRole
                UserRole role = new UserRole();
                role.RoleId = request.RoleId != 0 ? request.RoleId : (int)RoleEnum.Buyer;
                role.UserId = user.UserId;
                await _uow.Repository<UserRole>().AddAsync(role);
                await _uow.SaveChangesAsync();

                // Send mail to confirm
                string token = GenerateConfirmToken(user);
                await SendConfirmEmail(user.UserMail, token);

                string maskEmail = MaskEmail(user.UserMail);
                await _uow.CommitTransactionAsync(transaction);
                return new SuccessResponse<string>(
                    $"Tạo tài khoản thành công!\n\n" +
                    $"Vui lòng kiểm tra mail {maskEmail} để kích hoạt tài khoản và đăng nhập.\n" +
                    $"Nếu không thấy email trong hộp thư đến, hãy xem trong mục Spam hoặc Thư rác.");
            }
            catch (Exception error)
            {
                await _uow.RollbackTransactionAsync(transaction);
                return new FailResponse<string>("Tạo tài khoản không thành công, lỗi: " + error.Message);
            }
        }
        public async Task<Response<string>> ConfirmRegister(string token)
        {
            try
            {
                var claims = ValidateConfirmToken(token);
                string email = claims.FirstOrDefault(_ => _.Type == "email")?.Value;
                string userId = claims.FirstOrDefault(_ => _.Type == "id")?.Value;
                var user = (await _uow.Repository<User>()
                    .GetByAsync(_ => _.UserId == int.Parse(userId)))
                    .FirstOrDefault();
                if (user != null)
                {
                    user.IsActived = true;
                    _uow.Repository<User>().Update(user);
                    await _uow.SaveChangesAsync();
                    return new SuccessResponse<string>("Xác thực thành công");
                }
                return new FailResponse<string>("Xác thực thất bại");
            }
            catch
            {
                return new FailResponse<string>("Xác thực thất bại");
            }
        }
        public async Task<Response<string>> ResetPassword(ResetPasswordRequest dto)
        {
            try
            {
                var claims = TokenPrincipal(getAccessToken());
                string userId = claims.FirstOrDefault(_ => _.Type == "id")?.Value;
                var user = (await _uow.Repository<User>()
                    .GetByAsync(
                        _ => _.UserId == int.Parse(userId)
                            && _.Password == dto.Password))
                    .FirstOrDefault();
                if (user == null)
                    return new FailResponse<string>("Mật khẩu không hợp lệ");
                if (dto.ReNewPassword != dto.NewPassword || string.IsNullOrEmpty(dto.NewPassword) || string.IsNullOrEmpty(dto.ReNewPassword))
                    return new FailResponse<string>("Mật khẩu mới không trùng hoặc không chính xác");

                user.Password = dto.ReNewPassword;
                _uow.Repository<User>().Update(user);
                await _uow.SaveChangesAsync();
                return new SuccessResponse<string>("Đổi mật khẩu thành công");
            }
            catch
            {
                return new FailResponse<string>("Đổi mật khẩu thất bại");
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
                    seller = new User();

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
                {
                    seller.UserName = generateUserName(request.fullName.Trim(), phonenumber);
                    _uow.Repository<User>().AddAsync(seller).Wait();
                }
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
        public async Task<Response<User>> getCurrentUser()
        {
            int id = getCurrentUserId();
            var user = await _uow.Repository<User>().FindByAsync(_ => _.UserId == id);
            return new SuccessResponse<User>(user);
        }
        public async Task updateUserName()
        {
            var users = await _uow.Repository<User>().GetByAsync(_ => _.UserName == null);
            foreach (var user in users)
            {
                user.UserName = generateUserName(user.UserFullName, user.UserPhone);
            }
            _uow.Repository<User>().Update(users);
            await _uow.SaveChangesAsync();
        }
        public int getCurrentUserId() 
        {
            if (getUserValue("id") == null) return -1;
            return Int32.Parse(getUserValue("id"));
        }
        public string getCurrentUserFullName() => getUserValue("fullName");
        public string getCurrentUserName() => getUserValue("userName");
        private string getUserValue(string key)
        {
            string accessToken = getAccessToken();
            if (string.IsNullOrEmpty(accessToken))
                return null;
            var userClaims = TokenPrincipal(accessToken);
            return userClaims?.FirstOrDefault(claim => claim.Type == key)?.Value;
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

            var claims = new List<Claim>
            {
                new Claim("id", user.id.ToString()),
                new Claim("tokenId", Guid.NewGuid().ToString()),
                new Claim("fullName", user.fullName),
                new Claim("phone", user.phone),
                new Claim("userName", user.userName),
            };
            foreach (var item in user.roles)
            {
                claims.Add(new Claim("roles", item));
            }
            foreach (var item in user.permissions)
            {
                claims.Add(new Claim("permissions", item));
            }
            var description = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(claims),
                Expires = DateTime.UtcNow.AddHours(4),
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(secretKeyBytes), SecurityAlgorithms.HmacSha256Signature)
            };
            var createToken = jwtTokenHandler.CreateToken(description);
            var writeToken = jwtTokenHandler.WriteToken(createToken);

            return writeToken;
        }
        public IEnumerable<Claim> TokenPrincipal(string token)
        {
            var secretKeyBytes = Encoding.UTF8.GetBytes(_appSetting.SecretKey);
            var tokenHandler = new JwtSecurityTokenHandler();
            // Define token validation parameters
            var validationParameters = new TokenValidationParameters
            {
                ValidateIssuerSigningKey = true,
                IssuerSigningKey = new SymmetricSecurityKey(secretKeyBytes),
                ValidateIssuer = false, // You may want to set this to true if issuer validation is required
                ValidateAudience = false, // You may want to set this to true if audience validation is required
                RequireExpirationTime = true,
                ValidateLifetime = true
            };
            // Decode and validate the token
            try
            {
                // This will throw an exception if the token is not valid
                SecurityToken validatedToken;
                var principal = tokenHandler.ValidateToken(token, validationParameters, out validatedToken);
                return principal.Claims;
            }
            catch (SecurityTokenException)
            {
                return null;
            }
        }
        private string GenerateConfirmToken(User user)
        {
            var jwtTokenHandler = new JwtSecurityTokenHandler();
            var secretKeyBytes = Encoding.UTF8.GetBytes(_appSetting.SecretKey);

            var claims = new List<Claim>
            {
                new Claim("id", user.UserId.ToString()),
                new Claim("tokenId", Guid.NewGuid().ToString()),
                new Claim("email", user.UserMail),
            };
            var description = new SecurityTokenDescriptor
            {
                Subject = new ClaimsIdentity(claims),
                Expires = DateTime.UtcNow.AddDays(3),
                SigningCredentials = new SigningCredentials(new SymmetricSecurityKey(secretKeyBytes), SecurityAlgorithms.HmacSha256Signature)
            };
            var createToken = jwtTokenHandler.CreateToken(description);
            var writeToken = jwtTokenHandler.WriteToken(createToken);

            return writeToken;
        }
        private IEnumerable<Claim> ValidateConfirmToken(string token)
        {
            var secretKeyBytes = Encoding.UTF8.GetBytes(_appSetting.SecretKey);
            var tokenHandler = new JwtSecurityTokenHandler();
            // Define token validation parameters
            var validationParameters = new TokenValidationParameters
            {
                ValidateIssuerSigningKey = true,
                IssuerSigningKey = new SymmetricSecurityKey(secretKeyBytes),
                ValidateIssuer = false, // You may want to set this to true if issuer validation is required
                ValidateAudience = false, // You may want to set this to true if audience validation is required
                RequireExpirationTime = true,
                ValidateLifetime = true
            };
            SecurityToken validatedToken;
            var principal = tokenHandler.ValidateToken(token, validationParameters, out validatedToken);
            return principal.Claims;
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
        private bool IsValidEmail(string email)
        {
            if (string.IsNullOrWhiteSpace(email))
                return false;
            // Regular expression for validating an email
            string emailPattern = @"^[^@\s]+@[^@\s]+\.[^@\s]+$";
            return Regex.IsMatch(email, emailPattern);
        }
        private string MaskEmail(string email)
        {
            // Split the email address into the local part and domain part
            var atIndex = email.IndexOf('@');
            if (atIndex < 0)
            {
                throw new ArgumentException("Invalid email address");
            }

            string localPart = email.Substring(0, atIndex);
            string domainPart = email.Substring(atIndex);

            // Ensure we leave the first 3 characters and the last 2 characters of the local part visible
            if (localPart.Length <= 5)
            {
                // For short local parts, show only the first character
                return localPart.Substring(0, 1) + "****" + domainPart;
            }

            // For longer local parts, hide everything except the first 3 and last 2 characters
            return localPart.Substring(0, 3) + new string('*', localPart.Length - 5) + localPart.Substring(localPart.Length - 2) + domainPart;
        }
        private async Task SendConfirmEmail(string email, string token)
        {
            string filePath = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "templates", "verify", "verify-account.html");
            string template = File.ReadAllText(filePath);
            string url = "https://www.hihichi.com/verify-account?token=";
#if DEBUG
            url = "https://localhost:44330/verify-account?token=";
#endif
            url += token;
            template = template.Replace("{{action_url}}", url);
            await _emailService.SendEmailAsync(
                new SendMailDto
                {
                    Subject = "Xác thực tài khoản của bạn",
                    Message = template,
                    Tos = new List<string> { email }
                });
        }
        
    }
}
