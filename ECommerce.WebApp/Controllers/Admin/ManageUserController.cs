﻿using ECommerce.Application.Constants;
using ECommerce.Application.Services.Chat;
using ECommerce.Application.Services.Comment;
using ECommerce.Application.BaseServices.Role;
using ECommerce.Application.BaseServices.Shop;
using ECommerce.Application.BaseServices.User;
using ECommerce.Application.BaseServices.User.Dtos;
using ECommerce.Application.BaseServices.User.Enums;
using ECommerce.Application.Services.User;
using ECommerce.WebApp.Models.ManageUser;
using ECommerce.WebApp.Utils;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Hosting;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace ECommerce.WebApp.Controllers.Admin
{
    [Authorize(AuthenticationSchemes = "AdminAuth")]
    [Authorize(Policy = "Admin")]
    public class ManageUserController : Controller
    {
        private IUserBaseService _userService;
        private IUserService _userSerivceV2;
        private IShopService _shopService;
        private ICommentService _commentService;
        private IChatService _chatService;
        private ManageFiles _manageFiles;
        private HttpContextHelper _contextHelper;

        private const string DATETIME_LABEL = ConfigConstant.DATE_FORMAT;

        public ManageUserController(
            IUserBaseService userService,
            IUserService userSerivceV2,
            IShopService shopService,
            ICommentService commentService,
            IChatService chatService,
            IWebHostEnvironment webHostEnvironment
        ) {
            _userService = userService;
            _userSerivceV2 = userSerivceV2;
            _shopService = shopService;
            _commentService = commentService;
            _chatService = chatService;
            _contextHelper = new HttpContextHelper();
            _manageFiles = new ManageFiles(webHostEnvironment);
        }
        public async Task<IActionResult> Index(UserGetRequest request)
        {
            request.userId = _contextHelper.GetCurrentUserId();
            var list = await _userService.getUsersByFiltered(request);
            return View(list);
        }
        public async Task<IActionResult> CurrentOnline(UserGetRequest request = null)
        {
            var currentUserId = _contextHelper.GetCurrentUserId();
            var result = await _userSerivceV2.GetUsers(request);

            result.Data = result.Data.Where(i => i.UserId != currentUserId).ToList();
            ViewBag.List = result.Data;
            ViewBag.DateTimeFormat = DATETIME_LABEL;

            return View();
        }
        public async Task<IActionResult> UnConfirmUser()
        {
            var list = await _userService.getAll();
            return View(list);
        }
        [HttpGet]
        public async Task<IActionResult> AddSeller()
        {
            var shops = await _shopService.getShopListBySystemUserAccount();
            return View(shops);
        }
        [HttpPost]
        public async Task<IActionResult> AddSeller(SignUpRequest request)
        {
            request.isSystemAccount = true;
            var result = await _userService.AddSeller(request);
            if (result.isSucceed)
            {
                return Ok(result.Message);
            }
            return BadRequest(result.Message);
        }
        public async Task<IActionResult> UserProfile(int id)
        {
            var user = await _userService.UserProfile(id);
            if (user == null) return NotFound();

            var shop = await _shopService.getShopList();
            var model = new ManageUserProfileViewModel
            {
                User = user,
                Shops = shop
            };
            return View(model);
        }
        public async Task<IActionResult> UpdateUser(UserUpdateRequest request)
        {
            var result = await _userService.UpdateManageUserProfile(request);
            if (result.isSucceed)
            {
                return Ok(result.Message);
            }
            return BadRequest(result.Message);
        }
        public async Task<IActionResult> DeleteUser(int id)
        {
            var userId = Int32.Parse(User.Claims.FirstOrDefault(i => i.Type == "UserId").Value);
            if (userId == id) return BadRequest("Không thể xóa tài khoản của chính bạn");

            // Delete comment and comment images
            var deleteCommentRes = await _commentService.DeleteByUserId(id);
            if (deleteCommentRes.isSucceed)
                _manageFiles.DeleteFiles(deleteCommentRes.Data, FilePathConstant.RATE_FILEPATH);

            var result = await _userService.DeleteUser(id);
            if (result.isSucceed) return Ok(result.Message);

            return BadRequest(result.Message);
        }
    }
}
