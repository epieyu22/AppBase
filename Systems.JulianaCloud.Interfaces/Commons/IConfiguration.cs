using Systems.JulianaCloud.Interfaces.Commons;

namespace Systems.JulianaCloud.Interfaces.Commons
{
    public interface IConfiguration
    {
        string ImagesPath { get; }

        ISettings Settings { get; }

        string TemporalFilesFolderPath { get; }
    }
}