using Microsoft.Extensions.DependencyInjection;
using Microsoft.Extensions.Configuration;
using Systems.JulianaCloud.Interfaces.Data;
using Systems.JulianaCloud.Data;
using Systems.JulianaCloud.Commons;
using AutoMapper;
using System;
using Systems.JulianaCloud.Interfaces.Business.Crud;
using Systems.JulianaCloud.Business.Crud;
using Systems.JulianaCloud.TransferObjects.Lambda;
using Systems.JulianaCloud.Interfaces.Business.Utilities.Lambda;
using Systems.JulianaCloud.Business.Utilities.Lambda;
using Systems.JulianaCloud.Interfaces.Business.Utilities.Domain;
using Systems.JulianaCloud.Business.Utilities.Domain;
using Systems.JulianaCloud.Business.Utilities.Domain.Pipes;
using System.Collections.Generic;
using Systems.JulianaCloud.Interfaces.Business.Authentication;
using Systems.JulianaCloud.Business.Authentication;

namespace Systems.JulianaCloud.Bootstraper
{
    public static class IocConfig
    {
        public static void RegisterServices(IServiceCollection services)
        {
            IMapper mapper = GetMappingConfiguration().CreateMapper();
            services.AddDbContext<IUnitOfWork, UnitOfWork>();
            services.AddTransient<IRepositoryCollection, RepositoryCollection>();
            services.AddDbContext<IAppUserContext, AppUserContext>();
            services.AddScoped(typeof(IAuthService), typeof(AuthService));
            services.AddScoped(typeof(ISecurityService), typeof(SecurityService));
            services.AddScoped(typeof(IBasicCrudService<,,>), typeof(BasicCrudService<,,>));
            services.AddScoped<ICityService, CityService>();
            services.AddScoped<IMapper>((IServiceProvider provider) => mapper);
            services.AddScoped<ILambdaBuilder, LambdaBuilder>();

            RegisterPipelines(services);
        }

        public static void RegisterAppConfig(IServiceCollection services, IConfiguration config)
        {
            services.Configure<Settings>(config.GetSection("Config"));

            services.AddScoped<Interfaces.Commons.IConfiguration, Configuration>();
        }

        private static MapperConfiguration GetMappingConfiguration()
        {
            return new MapperConfiguration(cfg =>
            {
                cfg.AddProfile(new MappingProfile());
            });
        }

        public static void ConfigureEntityTransformationPipeline(IServiceProvider serviceProvider)
        {
            var entityTransformationPipeline = serviceProvider.GetService<IEntityTransformationPipeline>();

            var pipes = serviceProvider.GetServices<IEntityTransformPipe>();

            foreach (IEntityTransformPipe pipe in pipes)
            {
                entityTransformationPipeline.Register(pipe);
            }
            
        }

        private static void RegisterPipelines(IServiceCollection services)
        {
            services.AddSingleton<IEntityTransformationPipeline, EntityTransformationPipeline>();
            
            // Entity transformation pipes
            services.AddSingleton<IEntityTransformPipe, BooleanPropertyMappingTransformPipe>();
            services.AddSingleton<IEntityTransformPipe, DatePropertyMappingTransformPipe>();
        }



    }
}
