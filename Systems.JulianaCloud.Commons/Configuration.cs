using Microsoft.Extensions.Options;
using Systems.JulianaCloud.Interfaces.Commons;
using Microsoft.AspNetCore.Hosting;
using System.IO;

namespace Systems.JulianaCloud.Commons
{
    public class Configuration : IConfiguration
    {

        #region Fields

        private readonly IHostingEnvironment environment;

        #endregion

        #region Properties

        public ISettings Settings { get; private set; }

        public string ImagesPath
        {
            get => Path.Combine(environment.ContentRootPath, "images");
        }

        public string TemporalFilesFolderPath
        {
            get => Path.Combine(environment.ContentRootPath, "temp");
        }

        #endregion

        #region Constructor

        public Configuration(IOptions<Settings> settings, IHostingEnvironment environment)
        {
            this.Settings = settings.Value;
            this.environment = environment;
        }

        #endregion


    }
}
