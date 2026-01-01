using Microsoft.AspNetCore.Authentication.JwtBearer;
using Microsoft.AspNetCore.Builder;
using Microsoft.AspNetCore.Hosting;
using Microsoft.Extensions.Configuration;
using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Hosting;
using Microsoft.IdentityModel.Tokens;
using System;
using Systems.JulianaCloud.Api;
using Systems.JulianaCloud.Bootstraper;

namespace Systems.JulianaCloud.Web
{
    public class Startup
    {
        public Startup(IConfiguration configuration)
        {
            Configuration = configuration;

            EnviromentConfig.SetEnviroment(configuration);
        }

        public IConfiguration Configuration { get; }

        // This method gets called by the runtime. Use this method to add services to the container.
        public void ConfigureServices(IServiceCollection services)
        {
            services.AddControllersWithViews()
                .AddApplicationPart(typeof(PositionController).Assembly);
            services.AddHttpContextAccessor();

            services.AddAuthentication(JwtBearerDefaults.AuthenticationScheme)
            .AddJwtBearer(options =>
            {
                options.TokenValidationParameters = new TokenValidationParameters
                {
                    ValidateIssuer = true,
                    ValidateAudience = true,
                    ValidateIssuerSigningKey = true,
                    ValidateLifetime = true,
                    ValidIssuer = Configuration["JWT:Issuer"],
                    ValidAudience = Configuration["JWT:Audience"],
                    IssuerSigningKey = new SymmetricSecurityKey(Convert.FromBase64String(Configuration["JWT:Secret"]))
                };

            });

            services.AddAuthorization();


            IocConfig.RegisterAppConfig(services, Configuration);
            IocConfig.RegisterServices(services);
        }

        // This method gets called by the runtime. Use this method to configure the HTTP request pipeline.
        public void Configure(IApplicationBuilder app, IWebHostEnvironment env)
        {

            if (env.IsDevelopment())
            {
                app.UseDeveloperExceptionPage();
            }
            else
            {
                app.UseExceptionHandler("/Error");
                // The default HSTS value is 30 days. You may want to change this for production scenarios, see https://aka.ms/aspnetcore-hsts.
                app.UseHsts();
            }

            app.UseHttpsRedirection();
            app.UseStaticFiles();

            app.UseRouting();
            app.UseAuthentication();
            app.UseAuthorization();
            app.UseEndpoints(endpoints =>
            {
                endpoints.MapControllerRoute(
                    name: "default",
                    pattern: "{controller}/{action=Index}/{id?}");
            });

            // SPA Configuration for .NET 8
            if (env.IsDevelopment())
            {
                // In development, proxy to Angular dev server
                app.UseSpa(spa =>
                {
                    spa.Options.SourcePath = "app";
                    spa.UseProxyToSpaDevelopmentServer("http://localhost:4200");
                });
            }
            else
            {
                // In production, serve static files from dist folder
                app.UseDefaultFiles();
                app.MapFallbackToFile("index.html");
            }

            IocConfig.ConfigureEntityTransformationPipeline(app.ApplicationServices);
        }
    }
}
