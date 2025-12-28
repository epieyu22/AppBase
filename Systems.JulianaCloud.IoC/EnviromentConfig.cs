using System;
using System.Collections.Generic;
using System.Text;
using Microsoft.Extensions.Configuration;

namespace Systems.JulianaCloud.Bootstraper
{
    public static class EnviromentConfig
    {
        private const string DEFAULT_ENV_SUFFIX = "dev";
        private static string env = DEFAULT_ENV_SUFFIX; 


        public static IConfiguration SetEnviroment(IConfiguration config)
        {
            try
            {
                
                env = config.GetSection("Environment").Value;
            }
            catch (Exception)
            {
                env = DEFAULT_ENV_SUFFIX;
            }

            return config;

        }

        public static string GetEnvironment() => env;

    }
}
