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
using System.Collections.Generic;
using Systems.JulianaCloud.Interfaces.Business.Authentication;
using Systems.JulianaCloud.Business.Authentication;
using Systems.JulianaCloud.Business.Utilities.Identity;
using Systems.JulianaCloud.Interfaces.Business.Utilities.Identity;
using Systems.JulianaCloud.Business.Novelties.Reporting;
using Systems.JulianaCloud.Interfaces.Business.Novelties.Reporting;
using Systems.JulianaCloud.Business.Pipelines.Domain.Pipes;
using Systems.JulianaCloud.Business.Pipelines.Shared;
using Systems.JulianaCloud.Interfaces.Business.Pipelines.Shared.Pipes;
using Systems.JulianaCloud.Interfaces.Business.Pipelines.Shared;
using Systems.JulianaCloud.Interfaces.Business.Novelties;
using Systems.JulianaCloud.Business.Novelties;
using Systems.JulianaCloud.Interfaces.Business.Employee;
using Systems.JulianaCloud.Business.Employee;

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
            services.AddScoped<INoveltiesReportService, NoveltiesReportService>();
            services.AddScoped<INoveltiesReportFiltersBuilder, NoveltiesReportFiltersBuilder>();
            services.AddScoped<INoveltyMasterService, NoveltyMasterService>();
            services.AddScoped<IEmployeeMasterService, EmployeeMasterService>();
            
            services.AddScoped<ICityService, CityService>();
            services.AddScoped<IDigitVerificationService, DigitVerificationService>();
            services.AddScoped<ITotalEmployeesService, TotalEmployeesService>();
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
