using System;
using System.IO;
using ECommerce.Utilities.Shared.Responses;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Diagnostics;
using Microsoft.AspNetCore.Http;
using Microsoft.Extensions.Logging;
using Newtonsoft.Json;
using Newtonsoft.Json.Serialization;

namespace ECommerce.Infrastructure.Middlewares
{
    public static class HandleExceptionMiddleware
    {
        public static void ConfigureExceptionHandler(this IApplicationBuilder app, ILoggerFactory loggerFactory)
        {
            var logger = loggerFactory.CreateLogger("GlobalExceptionHandler");
            app.UseExceptionHandler(errorApp =>
            {
                errorApp.Run(async context =>
                {
                    // Log the exception
                    var exceptionHandlerFeature = context.Features.Get<IExceptionHandlerFeature>();
                    var exception = exceptionHandlerFeature?.Error;
                    logger.LogError(exception, "An unhandled exception occurred.");

                    // Write the error details to a text file
                    var logDirectory = Path.Combine(Directory.GetCurrentDirectory(), "wwwroot", "logs");
                    var logFileName = $"error_{DateTime.Now:yyyyMMMMdd_HHmmss}.txt";
                    var logFilePath = Path.Combine(logDirectory, logFileName);
                    Directory.CreateDirectory(logDirectory); // Ensure the directory exists
                    using (var writer = new StreamWriter(logFilePath))
                    {
                        await writer.WriteLineAsync($"Timestamp: {DateTime.Now}");
                        await writer.WriteLineAsync($"Error: {exception?.Message}");
                        await writer.WriteLineAsync($"StackTrace: {exception?.StackTrace}");
                        // Add more details as needed
                    }

                    // Return an appropriate response to the client
                    context.Response.StatusCode = 500;
                    context.Response.ContentType = "application/json";
                    var failResponse = new FailResponse<string>(exception.Message);

                    var serializerSettings = new JsonSerializerSettings();
                    serializerSettings.ContractResolver = new CamelCasePropertyNamesContractResolver();
                    var jsonReponse = JsonConvert.SerializeObject(failResponse, serializerSettings);

                    await context.Response.WriteAsync(jsonReponse);
                });
            });
        }
    }
}
