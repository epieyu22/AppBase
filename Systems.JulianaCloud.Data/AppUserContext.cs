using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Systems.JulianaCloud.Domain.Authentication;
using Systems.JulianaCloud.Interfaces.Data;

namespace Systems.JulianaCloud.Data
{
    public class AppUserContext : DbContext, IAppUserContext
    {
        const string DEFAULT_CONNECTION_STRING_KEY = "Main";
        const string DEFAULT_DB_AUTH = "UserAuthentication";
        private readonly IConfiguration configuration;
        public virtual DbSet<AppUser> AppUsers
        {
            get;
            set;
        }

        public AppUserContext(IConfiguration configuration)
        {
            this.configuration = configuration;
        }

        protected override void OnConfiguring(DbContextOptionsBuilder optionsBuilder)
        {
            optionsBuilder.UseSqlServer(string.Format(configuration.GetConnectionString(DEFAULT_CONNECTION_STRING_KEY),
                DEFAULT_DB_AUTH,
                configuration[$"Credentials:{DEFAULT_DB_AUTH}:user"],
                configuration[$"Credentials:{DEFAULT_DB_AUTH}:pass"]));
        }

        protected override void OnModelCreating(ModelBuilder modelBuilder)
        {
            modelBuilder.Entity<AppUser>().ToTable("Users").HasKey(p => p.Key);
        }

        public object GetContext()
        {
            return AppUsers;
        }
    }
}
