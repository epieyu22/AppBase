using Microsoft.AspNetCore.Http;
using Microsoft.EntityFrameworkCore;
using Microsoft.EntityFrameworkCore.ChangeTracking;
using Microsoft.Extensions.Logging;
using System;
using Systems.JulianaCloud.Business.Authentication;
using Systems.JulianaCloud.Domain;
using Systems.JulianaCloud.Domain.Authentication;
using Systems.JulianaCloud.Domain.Employee;
using Systems.JulianaCloud.Domain.Generals;
using Systems.JulianaCloud.Interfaces.Commons;
using Systems.JulianaCloud.Interfaces.Data;
using Systems.JulianaCloud.Resources;
using Microsoft.Extensions.Configuration;

namespace Systems.JulianaCloud.Data
{
    public class UnitOfWork : DbContext, IUnitOfWork
    {
        #region Constants

        private const string DEFAULT_CONNECTION_STRING_KEY = "Default";

        #endregion

        #region Fields

        private readonly ILogger<UnitOfWork> logger;
        private readonly Microsoft.Extensions.Configuration.IConfiguration configuration;
        private IRepositoryCollection repositories;
        private readonly IHttpContextAccessor httpContextAccessor;
        private string connection;

        #endregion

        #region Properties
        public IRepositoryCollection Repositories { get => repositories; }

        #endregion

        #region Constructor

        public UnitOfWork(
            Microsoft.Extensions.Configuration.IConfiguration configuration, 
            ILogger<UnitOfWork> logger, 
            IRepositoryCollection repositories,
            IHttpContextAccessor httpContextAccessor
        )
        {
            this.logger = logger;
            this.configuration = configuration;
            this.repositories = repositories;
            this.httpContextAccessor = httpContextAccessor;

        }

        #endregion

        #region Public methods
        
        public void CommitChanges()
        {
            try
            {
                this.SaveChanges();
            }
            catch (Exception ex)
            {
                RevertEntitiesStates();

                logger.LogError(ex, Messages.GenericErrorMessage);

                throw;
            }
        }

        #endregion

        #region Private methods

        private string GetConnection(string db = "UserAuthentication")
        {
            return string.Format(configuration.GetConnectionString(DEFAULT_CONNECTION_STRING_KEY),
                db,
                configuration[$"Credentials:{db}:user"],
                configuration[$"Credentials:{db}:pass"]);
        }

        public void Initialize()
        {
            var token = httpContextAccessor.HttpContext.Request.Headers["Authorization"];
            bool isAllowed = !string.IsNullOrEmpty(token);

            isAllowed = true;
            if (isAllowed)
            {
                connection = GetConnection(/*AuthService.UserInfo(token).Company*/ string.Empty);
                RegisterRepository<Position>();
                RegisterRepository<Zone>();
                RegisterRepository<Country>();
                RegisterRepository<Profession>();
                RegisterRepository<Company>();
                RegisterRepository<Eps>();
                RegisterRepository<Department>();
                RegisterRepository<City>();
                RegisterRepository<Arl>();
                RegisterRepository<Subsidiary>();
                RegisterRepository<Caja>();
                RegisterRepository<CostCenter>();
                RegisterRepository<Holiday>();
                RegisterRepository<User>();
                RegisterRepository<Withdrawal>();
            }
        }

        public void InitializeAuth(string company)
        {
            connection = GetConnection(company);
            RegisterRepository<User>();
        }

        private void RevertEntitiesStates()
        {          
            foreach (EntityEntry entry in this.ChangeTracker.Entries())
            {
                switch (entry.State)
                {
                    case EntityState.Modified:
                        entry.State = EntityState.Unchanged;
                        break;
                    
                    case EntityState.Added:
                        entry.State = EntityState.Detached;
                        break;

                    case EntityState.Deleted:
                        entry.Reload();
                        break;
                    default: break;
                }
            }
        }

        private void RegisterRepository<T>(DbSet<T> table = null) where T : class
        {
            table = table ?? this.Set<T>();

            Type typeOfEntity = typeof(T);

            repositories.Register<T>(new Repository<T>(this, table));
        }

        #endregion

        #region Events

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder
                .UseLazyLoadingProxies()
                .UseSqlServer(connection);
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<Position>().HasKey(p => p.Key);
            modelBuilder.Entity<Zone>().HasKey(p => p.Key);
            modelBuilder.Entity<Country>().HasKey(p => p.Key);
            modelBuilder.Entity<Profession>().HasKey(p => p.Key);
            modelBuilder.Entity<Company>().HasKey(p => p.Key);
            modelBuilder.Entity<Eps>().HasKey(p => p.Key);
            modelBuilder.Entity<Department>().HasKey(p => p.Key);
            modelBuilder.Entity<City>().HasKey(p => p.Key);
            modelBuilder.Entity<Arl>().HasKey(p => p.Key);
            modelBuilder.Entity<Subsidiary>().HasKey(p => p.Key);
            modelBuilder.Entity<Caja>().HasKey(p => p.Key);
            modelBuilder.Entity<CostCenter>().HasKey(p => p.Key);
            modelBuilder.Entity<Holiday>().HasKey(p => p.Key);
            modelBuilder.Entity<Withdrawal>().HasKey(p => p.Key);            
            modelBuilder.Entity<User>().HasKey(p => p.Key);
        }

        #endregion
    }
}
