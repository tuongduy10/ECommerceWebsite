﻿using ECommerce.Application.Services.Notification;
using ECommerce.Application.BaseServices.Rate;
using ECommerce.Application.BaseServices.Shop;
using ECommerce.Application.BaseServices.User;
using ECommerce.Application.Services.User;
using ECommerce.WebApp.Hubs;
using ECommerce.WebApp.Utils;
using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using Microsoft.AspNetCore.SignalR;
using Microsoft.Extensions.Logging;
using System;
using System.Linq;
using System.Threading.Tasks;

namespace ECommerce.WebApp.Controllers.Client
{
    [Authorize(AuthenticationSchemes = "ClientAuth")]
    public class AccountController : Controller
    {
        private ILogger<AccountController> _logger;
        private IUserBaseService _userService;
        private IUserService _userServiceV2;
        private IShopService _shopService;
        private IRateService _rateService;
        private INotificationService _notificationService;
        private IHubContext<ClientHub> _clientHub;
        private HttpContextHelper _contextHelper;
        public AccountController(
            ILogger<AccountController> logger,
            IUserBaseService userService,
            IUserService userServiceV2,
            IShopService shopService,
            IRateService rateService,
            IHubContext<ClientHub> clientHub,
            INotificationService notificationService)
        {
            _logger = logger;
            _userService = userService;
            _userServiceV2 = userServiceV2;
            _shopService = shopService;
            _rateService = rateService;
            _notificationService = notificationService;
            _clientHub = clientHub;
            _contextHelper = new HttpContextHelper();
        }

        [AllowAnonymous]
        public async Task<IActionResult> SignIn(string CurrentUrl = "/")
        {
            if (User.Identity.IsAuthenticated)
            {
                return RedirectToAction("Index", "Home");
            }
            ViewData["ReturnUrl"] = CurrentUrl;
            return View();
        }
        [AllowAnonymous]
        public async Task<IActionResult> SignUp()
        {
            return View();
        }
        public async Task<IActionResult> SignOut()
        {
            // set offline status, send to client
            var userIdFromContext = _contextHelper.GetCurrentUserId();
            if (userIdFromContext != 0)
            {
                var res = await _userServiceV2.UpdateOnlineStatus(userIdFromContext, false);
                await _clientHub.Clients.All.SendAsync("onChangeStatus", res);
            }
            
            await HttpContext.SignOutAsync("ClientAuth");
            return RedirectToAction("SignIn", "Account");
        }
        public async Task<IActionResult> Notifications()
        {

            var _id = User.Claims.FirstOrDefault(i => i.Type == "UserId") != null ?
                Int32.Parse(User.Claims.FirstOrDefault(i => i.Type == "UserId").Value) : 0;

            var notifications = await _notificationService.GetAllByUserIdAsync(_id);
            ViewBag.Notifications = notifications;

            return View();
        }
        public async Task<IActionResult> UserProfile()
        {
            var _id = _contextHelper.GetCurrentUserId();

            var user = await _userService.UserProfile(_id);
            if (user == null || user.Status == false) return RedirectToAction("SignOut", "Account");
            
            return View(user);
        }
        public async Task<IActionResult> UpdateUserPhoneNumber()
        {
            return View();
        }
        public async Task<IActionResult> UpdateUserPassword()
        {
            return View();
        }
        public async Task<IActionResult> SaleRegistration()
        {
            var id = Int32.Parse(User.Claims.FirstOrDefault(i => i.Type == "UserId").Value);
            var result = await _shopService.isRegisted(id);
            var model = new SaleRegistrationModel();

            if (!result.isSucceed || result.ObjectData == null)
            {
                model.isRegisted = false;
                return View(model);
            }

            var shop = result.ObjectData.GetType();
            var status = Int32.Parse(shop.GetProperty("Status").GetValue(result.ObjectData, null).ToString());
            model.isRegisted = true;
            model.status = status;

            return View(model);
        }
        public async Task<IActionResult> DeleteShop()
        {
            var id = Int32.Parse(User.Claims.FirstOrDefault(i => i.Type == "UserId").Value);
            var result = await _shopService.deleteShop(id);
            if (result.isSucceed)
            {
                return RedirectToAction("SaleRegistration", "Account");
            }
            ViewBag.Message = result.Message;
            return RedirectToAction("SaleRegistration", "Account");
        }
        [AllowAnonymous]
        public async Task<IActionResult> ResetPassword()
        {
            return View();
        }
        [AllowAnonymous]
        public async Task<IActionResult> AccessDenied()
        {
            return View();
        }
    }
    public class SaleRegistrationModel
    {
        public bool isRegisted { get; set; }
        public int status { get; set; }
    }
}
