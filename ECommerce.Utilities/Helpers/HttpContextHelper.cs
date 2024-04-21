using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;

namespace ECommerce.Utilities.Helpers
{
    public class HttpContextHelper
    {
        private readonly IHttpContextAccessor _httpContextAccessor;
        public HttpContextHelper()
        {
            _httpContextAccessor = new HttpContextAccessor();
        }
        public int GetCurrentUserId()
        {
            string id = GetByKey("UserId");
            return Int32.Parse(id);
        }
        public string GetCurrentUserPhone()
        {
            return GetByKey("UserPhone");
        }
        public string getAccessToken()
        {
            var authorizationHeader = _httpContextAccessor.HttpContext.Request.Headers["Authorization"].ToString();
            if (string.IsNullOrWhiteSpace(authorizationHeader) || !authorizationHeader.StartsWith("Bearer "))
                return "";
            var token = authorizationHeader.Substring("Bearer ".Length);
            return token;
        }
        private string GetByKey(string key)
        {
            return _httpContextAccessor.HttpContext.User.Claims.FirstOrDefault(_ => _.Type == key)?.Value;
        }
    }
}
