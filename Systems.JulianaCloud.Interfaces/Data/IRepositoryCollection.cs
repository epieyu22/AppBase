namespace Systems.JulianaCloud.Interfaces.Data
{
    public interface IRepositoryCollection
    {
        void Register<T>(IRepository<T> repository) where T : class;
        IRepository<T> Use<T>() where T : class;
    }
}