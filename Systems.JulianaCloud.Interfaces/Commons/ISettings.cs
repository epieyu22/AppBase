using System.Collections.Generic;

namespace Systems.JulianaCloud.Interfaces.Commons
{
    public interface ISettings
    {
        string AppName { get; set; }
        Dictionary<string, string> ConnectionStrings { get; set; }
        string Version { get; set; }
    }
}