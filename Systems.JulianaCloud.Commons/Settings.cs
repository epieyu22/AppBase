using System;
using System.Collections.Generic;
using System.Text;
using Systems.JulianaCloud.Interfaces.Commons;

namespace Systems.JulianaCloud.Commons
{
    public class Settings : ISettings
    {
        public string AppName { get; set; }

        public string Version { get; set; }

        public Dictionary<string, string> ConnectionStrings { get; set; }
    }
}
