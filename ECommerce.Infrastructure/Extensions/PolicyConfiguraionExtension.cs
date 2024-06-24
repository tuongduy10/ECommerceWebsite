using ECommerce.Utilities.Constants;
using Microsoft.AspNetCore.Cors.Infrastructure;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Text;

namespace ECommerce.Infrastructure.Extensions
{
    public static class PolicyConfiguraionExtension
    {
        public static void AddPolicyConfiguration(this IServiceCollection services, IConfiguration configuration)
        {
            services.AddCors(options =>
            {
                options.AddPolicy(ConfigConstant.CORS_POLICY,
                    builder =>
                    {
                        builder.WithOrigins("https://localhost:44330", "http://localhost:3000", "https://hihichi.com", "http://192.168.1.10:3000")
                            .AllowAnyHeader()
                            .AllowAnyMethod();
                    });
            });
        }

    }
}
