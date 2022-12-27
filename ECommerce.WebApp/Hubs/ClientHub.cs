﻿using ECommerce.Application.Services.User_v2;
using ECommerce.WebApp.Utils;
using Microsoft.AspNetCore.SignalR;
using Microsoft.Extensions.Logging;
using System;
using System.Threading.Tasks;

namespace ECommerce.WebApp.Hubs
{
    public class ClientHub : Hub
    {
        private IUserService_v2 _userServiceV2;
        private HttpContextHelper _contextHelper;
        private ILogger<ClientHub> _logger;
        private IHubContext<CommonHub> _commonHub;
        public ClientHub(
            IUserService_v2 userServiceV2, 
            ILogger<ClientHub> logger,
            IHubContext<CommonHub> commonHub)
        {
            _contextHelper = new HttpContextHelper();
            _userServiceV2 = userServiceV2;
            _logger = logger;
            _commonHub = commonHub;
        }
        // Online
        public override async Task OnConnectedAsync()
        {
            await SetOnline();
            await base.OnConnectedAsync();
        }
        // Offline
        public override async Task OnDisconnectedAsync(Exception exception)
        {
            await SetOffline();
            await base.OnDisconnectedAsync(exception);
        }
        public async Task SetOnline()
        {
            var userId = _contextHelper.GetCurrentUserId();
            if(userId != 0) await UpdateOnlineStatus(userId, true);
        }
        public async Task SetOffline()
        {
            var userId = _contextHelper.GetCurrentUserId();
            if(userId != 0) await UpdateOnlineStatus(userId, false);
        }
        public async Task UpdateOnlineStatus(int userId, bool status)
        {
            var result = await _userServiceV2.UpdateOnlineStatus(userId, status);
            await _commonHub.Clients.All.SendAsync("onUpdateUser", result);
        }
    }
}