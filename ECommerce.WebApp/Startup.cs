using ECommerce.Data.Context;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.Extensions.Logging;
using Microsoft.AspNetCore.SpaServices.ReactDevelopmentServer;
using ECommerce.Application.Extensions;
using Microsoft.AspNetCore.Http;
using ECommerce.Utilities.AppSettings;
using ECommerce.ECommerce.Infrastructure.Middlewares;
using ECommerce.Utilities.Helpers;
using ECommerce.Infrastructure.Extensions;
using ECommerce.Utilities.Constants;

namespace ECommerce.WebApp
{
    public class Startup
    {
        private readonly string myCorsPolicy = "_myCorsPolicy";
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {             
            string connStr = HashHelper.Decrypt(Configuration.GetConnectionString("ECommerceDB"));
            services.AddDbContext<ECommerceContext>(options => options.UseSqlServer(connStr));
            // Configure jwt
            services.AddJwtConfiguration(Configuration);
            // Configure cor policy
            services.AddPolicyConfiguration(Configuration);
            // Controller
            services.AddControllersWithViews();
            services.AddControllers()
                .AddNewtonsoftJson(options =>
                    options.SerializerSettings.ReferenceLoopHandling = Newtonsoft.Json.ReferenceLoopHandling.Ignore);

            //services.AddSignalR();
            services.AddHttpClient();
            services.AddHttpContextAccessor();

            services.Configure<AppSetting>(Configuration.GetSection("AppSettings"));

            // Services
            services.AddSingleton<IHttpContextAccessor, HttpContextAccessor>();
            services.AddAuthServices();
            services.AddTransientServices();
            services.AddJobServices();
            services.AddScopedServices();

            // In production, the React files will be served from this directory
            services.AddSpaStaticFiles(configuration => configuration.RootPath = "client/build");
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(
            IApplicationBuilder app,
            IWebHostEnvironment env,
            ILoggerFactory logger)
        {
            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }

            try
            {
                using (var serviceScope = app.ApplicationServices.GetRequiredService<IServiceScopeFactory>().CreateScope())
                {
                    var context = serviceScope.ServiceProvider.GetService<ECommerceContext>();
                    context.Database.Migrate();
                }
            }
            catch
            {
                throw;
            }

            // Serve default files and static files
            app.UseDefaultFiles();
            app.UseStaticFiles();
            app.UseSpaStaticFiles();

            // Configure cookie policy and CORS
            app.UseCookiePolicy();
            app.UseCors(ConfigConstant.CORS_POLICY);

            // Authentication and routing
            app.UseAuthentication();
            app.UseRouting();

            // Custom authentication middleware
            app.UseMiddleware<AuthMiddleware>();

            // Configure exception handling
            app.ConfigureExceptionHandler(logger);

            // Authorization
            app.UseAuthorization();

            // Map controllers
            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller}/{action=Index}/{id?}");
            });

            // Configure Single Page Application (SPA)
            app.UseSpa(spa =>
            {
                spa.Options.SourcePath = "client";
                if (env.IsDevelopment())
                {
                    spa.UseReactDevelopmentServer(npmScript: "start");
                }
            });

        }
    }
}
