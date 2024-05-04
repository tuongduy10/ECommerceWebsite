using Microsoft.AspNetCore.Authentication;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Threading.Tasks;
using Microsoft.AspNetCore.Mvc;
using Microsoft.Extensions.Logging;
using ECommerce.Utilities.Shared.Responses;
using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;
using Microsoft.AspNetCore.Diagnostics;
using ECommerce.Utilities.Constants;

namespace ECommerce.ECommerce.Infrastructure.Middlewares
{
    public class CustomAuthMiddleware
    {
        public readonly RequestDelegate _next;
        private readonly ILogger<CustomAuthMiddleware> _logger;
        public CustomAuthMiddleware(RequestDelegate next, ILogger<CustomAuthMiddleware> logger)
        {
            _next = next;
            _logger = logger;
        }
        public async Task InvokeAsync(HttpContext context)
        {
            await _next(context);
            
            int[] statusCodes = new int[] { 401, 403 };
            if (statusCodes.Contains(context.Response.StatusCode))
            {
                string message = "";
                if (context.Response.StatusCode == 401)
                    message = MessageConstant.UNAUTHORIZED;
                if (context.Response.StatusCode == 403)
                    message = MessageConstant.UNAUTHORIZED;
                var failResponse = new FailResponse<bool>(message);

                var serializerSettings = new JsonSerializerSettings();
                serializerSettings.ContractResolver = new CamelCasePropertyNamesContractResolver();
                var jsonReponse = JsonConvert.SerializeObject(failResponse, serializerSettings);

                context.Response.ContentType = "application/json";
                await context.Response.WriteAsync(jsonReponse);
            }
        }
    }
}
