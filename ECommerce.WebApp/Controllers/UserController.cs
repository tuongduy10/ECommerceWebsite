using ECommerce.Application.Common;
using ECommerce.Application.BaseServices.User.Dtos;
using ECommerce.Application.BaseServices.User;
using ECommerce.Application.Services.UserSrv;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using Microsoft.Extensions.Options;
using Microsoft.IdentityModel.Tokens;
using System.IdentityModel.Tokens.Jwt;
using System.Security.Claims;
using System.Text;
using System;
using System.Threading.Tasks;
using System.Linq;
using ECommerce.WebApp.Utils;
using ECommerce.Application.Services.UserSrv.Dtos;
using UserUpdateRequest = ECommerce.Application.Services.UserSrv.Dtos.UserUpdateRequest;
using ECommerce.Utilities.Helpers;
using ECommerce.Utilities.AppSettings;
using ECommerce.Utilities.Shared.Responses;

namespace ECommerce.WebApp.Controllers
{
    [Authorize]
    [ApiController]
    [Route("api/user")]
    public class UserController : ControllerBase
    {
        private readonly IUserService _userService;
        private readonly ILogger<UserController> _logger;
        private HttpContextHelper _contextHelper;
        private readonly AppSetting _appSetting;
        public UserController(
            ILogger<UserController> logger,
            IOptionsMonitor<AppSetting> optionsMonitor,
            IUserService userService)
        {
            _logger = logger;
            _contextHelper = new HttpContextHelper();
            _userService = userService;
            _appSetting = optionsMonitor.CurrentValue;
        }
        [HttpPost("user-list")]
        public async Task<IActionResult> getUserPagingList(UserGetRequest request)
        {
            var result = await _userService.getUserPagingList(request);
            if (!result.isSucceed)
                return BadRequest(result);
            return Ok(result);
        }
        [AllowAnonymous]
        [HttpPost("login")]
        public async Task<IActionResult> Login(SignInRequest request)
        {
            var result = await _userService.Login(request);
            if (!result.isSucceed)
                return BadRequest(result);
            return Ok(result);
        }
        [AllowAnonymous]
        [HttpPost("sign-up")]
        public async Task<IActionResult> SignUp(SignUpRequest request)
        {
            var result = await _userService.SignUp(request);
            if (!result.isSucceed)
                return BadRequest(result);
            return Ok(result);
        }
        [AllowAnonymous]
        [HttpGet("confirm-register")]
        public async Task<IActionResult> ConfirmRegister([FromQuery] string token)
        {
            var result = await _userService.ConfirmRegister(token);
            if (!result.isSucceed)
                return BadRequest(result);
            return Ok(result);
        }
        [AllowAnonymous]
        [HttpGet("forget-password")]
        public async Task<IActionResult> ForgetPassowrd([FromQuery] string userName)
        {
            var result = await _userService.ForgetPassword(userName);
            if (!result.isSucceed)
                return BadRequest(result);
            return Ok(result);
        }
        [HttpPost("reset-password")]
        public async Task<IActionResult> ResetPassword(ResetPasswordRequest dto)
        {
            var result = await _userService.ResetPassword(dto);
            if (!result.isSucceed)
                return BadRequest(result);
            return Ok(result);
        }
        [HttpPost("info")]
        public async Task<IActionResult> UserInfo()
        {
            try
            {
                var token = _userService.getAccessToken();
                if (string.IsNullOrEmpty(token))
                    return Unauthorized();

                int id = _userService.getCurrentUserId();
                var result = await _userService.GetUser(id);
                if (!result.isSucceed)
                    return BadRequest(result);
                return Ok((UserModel)result.Data);
            }
            catch (Exception error)
            {
                return BadRequest(error.Message);
            }
        }
        [HttpGet("shops")]
        public async Task<IActionResult> GetShops()
        {
            var res = await _userService.GetShops();
            if (!res.isSucceed)
                return BadRequest(res);
            return Ok(res);
        }
        [HttpPost("update-user")]
        public async Task<IActionResult> UpdateUser(UserShopModel request)
        {
            var result = await _userService.UpdateUser(request);
            if (!result.isSucceed)
                return BadRequest(result);
            return Ok(result);
        }
        [HttpGet("get-user/{id}")]
        public async Task<IActionResult> GetUser(int id)
        {
            var result = await _userService.GetUser(id);
            if (!result.isSucceed)
                return BadRequest(result);
            return Ok(result);
        }
        [HttpDelete("delete-user/{id}")]
        public async Task<IActionResult> DeleteUser(int id)
        {
            var result = await _userService.DeleteUser(id);
            if (!result.isSucceed)
                return BadRequest(result);
            return Ok(result);
        }
        [HttpPost("update-status")]
        public async Task<IActionResult> UpdateStatus(UserUpdateRequest request)
        {
            var result = await _userService.UpdateUserStatus(request);
            if (!result.isSucceed)
                return BadRequest(result);
            return Ok(result);
        }
        [HttpPost("update-username")]
        public async Task<IActionResult> updateUserName()
        {
            await _userService.updateUserName();
            return Ok();
        }
    }
}
