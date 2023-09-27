﻿using ECommerce.Application.Common;
using ECommerce.Application.Repositories.User;
using ECommerce.Application.BaseServices.User.Dtos;
using ECommerce.Data.Context;
using Microsoft.EntityFrameworkCore;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Http;
using ECommerce.Application.Constants;
using ECommerce.Data.Models;
using ECommerce.Application.Repositories;
using ECommerce.Application.Repositories.OnlineHistory;
using ECommerce.Application.Services.User.Dtos;
using ECommerce.Application.Repositories.Notification;

namespace ECommerce.Application.Services.User
{
    public class UserService : IUserService
    {
        private ECommerceContext _DbContext;
        private IUserRepository _userRepo;
        private IOnlineHistoryRepository _onlineHistoryRepo;
        private INotificationRepository _notiRepo;
        private IRepositoryBase<MessageHistory> _messageRepo;
        
        public UserService(ECommerceContext DbContext)
        {
            _DbContext = DbContext;
            if (_userRepo == null)
                _userRepo = new UserRepository(_DbContext);
            if(_onlineHistoryRepo == null)
                _onlineHistoryRepo = new OnlineHistoryRepository(_DbContext);
            if (_notiRepo == null)
                _notiRepo = new NotificationRepository(_DbContext);
            if (_messageRepo == null)
                _messageRepo = new RepositoryBase<MessageHistory>(_DbContext);
        }
        public int GetCurrentUserId()
        {
            return 0;
        }
        public IUserRepository User { get => _userRepo; }
        public async Task<Response<List<UserGetModel>>> GetUsers(UserGetRequest request = null)
        {
            try
            {
                var list = await _userRepo
                    .Query()
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
                    .ToListAsync();

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
                if (userId == 0) return new FailResponse<UserGetModel>("");
                var user = await _userRepo.FindAsyncWhere(i => i.UserId == userId);

                if (user == null) return new FailResponse<UserGetModel>("Không tìm thấy người dùng");
                var result = new UserGetModel()
                {
                    UserId = user.UserId,
                    IsOnline = user.IsOnline != null ? (bool)user.IsOnline : false,
                    LastOnlineLabel = user.LastOnline != null ? ((DateTime)user.LastOnline).ToString(ConfigConstant.DATE_FORMAT) : "",
                };

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
                    var user = await _userRepo.FindAsyncWhere(item => item.UserId == _userId);
                    if (user != null)
                    {
                        user.IsOnline = _isOnline;
                        user.LastOnline = DateTime.Now;
                        _userRepo.Update(user);
                        await _userRepo.SaveChangesAsync();
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
        public async Task<Response<UserGetModel>> UpdateOnlineStatus(int _userId, bool _isOnline)
        {
            try
            {
                if (_userId == 0) return new FailResponse<UserGetModel>("");

                var user = await _userRepo.FindAsyncWhere(item => item.UserId == _userId);
                if(user == null) return new FailResponse<UserGetModel>("Không tìm thấy người dùng");

                user.IsOnline = _isOnline;
                if(_isOnline == false) user.LastOnline = DateTime.Now;
                _userRepo.Update(user);
                await _userRepo.SaveChangesAsync();

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

                var user = await _userRepo.FindAsyncWhere(item => item.UserId == _userId);
                if (user == null) return new FailResponse<UserGetModel>("Không tìm thấy người dùng");

                var history = await _onlineHistoryRepo.FindAsyncWhere(i => i.UserId == _userId && i.Duration == 0);
                if (history == null)
                {
                    // create new logic here
                    var newHistory = new OnlineHistory()
                    {
                        AccessDate = DateTime.Now,
                        UserId = _userId,
                        Duration = 0
                    };
                    await _onlineHistoryRepo.AddAsync(newHistory);
                    await _onlineHistoryRepo.SaveChangesAsync();
                }
                else
                {
                    var totalMin = (DateTime.Now - (DateTime)user.LastOnline).TotalMinutes;
                    // update when over 3 minutes
                    if ((DateTime.Now - (DateTime)user.LastOnline).TotalSeconds >= 3)
                    {
                        int duration = Int32.Parse((DateTime.Now - (DateTime)history.AccessDate).TotalSeconds.ToString());
                        history.Duration = duration;
                        await _onlineHistoryRepo.SaveChangesAsync();
                    }
                }

                return new SuccessResponse<UserGetModel>("");
            }
            catch (Exception error)
            {
                return new FailResponse<UserGetModel>(error.ToString());
            }
        }
        public async Task<Response<UserGetModel>> ValidateUser(SignInRequest request)
        {
            try
            {
                if (string.IsNullOrEmpty(request.UserPhone) || string.IsNullOrEmpty(request.Password)) 
                    return new FailResponse<UserGetModel>("Thông tin không được để trống");

                var phonenumber = request.UserPhone;
                if (phonenumber.Contains("+84"))
                {
                    phonenumber = phonenumber.Replace("+84", "");
                    if (!phonenumber.StartsWith("0"))
                    {
                        phonenumber = "0" + phonenumber;
                    }
                }

                var result = await _DbContext.Users
                    .Where(i => i.UserPhone == phonenumber && i.Password == request.Password)
                    .FirstOrDefaultAsync();

                if (result == null) 
                    return new FailResponse<UserGetModel>("Mật khẩu hoặc tài khoản không đúng");
                if (result.Status == false) 
                    return new FailResponse<UserGetModel>("Tài khoản đã bị khóa");

                var roles = (
                    from role in _DbContext.Roles
                    from userrole in _DbContext.UserRoles
                    where role.RoleId == userrole.RoleId && userrole.UserId == result.UserId
                    select role.RoleName
                ).Distinct().ToList();

                UserGetModel user = new UserGetModel();
                user.UserId = result.UserId;
                user.UserFullName = result.UserFullName;
                user.UserRoles = roles;
                user.UserPhone = result.UserPhone;

                return new SuccessResponse<UserGetModel>("Đăng nhập thành công", user);
            }
            catch(Exception error)
            {
                return new FailResponse<UserGetModel>("Đang xảy ra lỗi, vui lòng thử lại sau");
            }
        }
    }
}
