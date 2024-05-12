using ECommerce.Utilities.Constants;
using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.IdentityModel.Tokens;
using System;
using System.Collections.Generic;
using System.Text;
using System.Threading.Tasks;

namespace ECommerce.Infrastructure.Extensions
{
    public static class JwtConfigurationExtension
    {
        public static void AddJwtConfiguration(this IServiceCollection services, IConfiguration configuration)
        {
            string secretKey = configuration.GetValue<string>(SystemConstant.AppSettings.SecretKey);
            byte[] secretKeyBytes = Encoding.UTF8.GetBytes(secretKey);
            services
                .AddAuthentication(option =>
                {
                    option.DefaultScheme = JwtBearerDefaults.AuthenticationScheme;
                    option.DefaultChallengeScheme = JwtBearerDefaults.AuthenticationScheme;
                })
                .AddJwtBearer(option =>
                {
                    option.TokenValidationParameters = new TokenValidationParameters
                    {
                        ValidateIssuer = false,
                        ValidateAudience = false,
                        ValidateLifetime = true,
                        ValidateIssuerSigningKey = true,
                        IssuerSigningKey = new SymmetricSecurityKey(secretKeyBytes),
                        ClockSkew = TimeSpan.Zero,
                    };
                    option.Events = new JwtBearerEvents
                    {
                        OnMessageReceived = context =>
                        {
                            // Bypass authentication for endpoints marked with [AllowAnonymous]
                            var anonymousEndpoint = context.HttpContext.GetEndpoint()?.Metadata?.GetMetadata<IAllowAnonymous>();
                            if (anonymousEndpoint != null)
                                context.Token = null;
                            return Task.CompletedTask;
                        }
                    };
                });
        }
    }
}
