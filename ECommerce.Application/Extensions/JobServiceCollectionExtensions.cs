using Microsoft.Extensions.DependencyInjection;
using System;
using System.Collections.Generic;
using System.Text;
using Quartz;
using ECommerce.Application.Services.ProductSrv.Jobs;

namespace ECommerce.Application.Extensions
{
    public static class JobServiceCollectionExtensions
    {
        public static void AddJobServices(this IServiceCollection services)
        {
            services.AddQuartz(options =>
            {
                options.UseMicrosoftDependencyInjectionJobFactory();

                var jobKey = JobKey.Create(nameof(ProcessUpdateNewProductJob));
                options
                    .AddJob<ProcessUpdateNewProductJob>(jobKey)
                    .AddTrigger(trigger =>
                        trigger
                            .ForJob(jobKey)
                            .WithCronSchedule("* * 6 ? * * *")); // "0 * * ? * *"
            });
            services.AddQuartzHostedService(options =>
            {
                options.WaitForJobsToComplete = true;
            });
        }
    }
}
