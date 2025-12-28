using Systems.JulianaCloud.Domain.Interfaces;

namespace Systems.JulianaCloud.Interfaces.Business.Pipelines.Shared
{
    public interface IEntityTransformationPipeline
    {
        IEntityTransformationPipeline Register(Pipes.IEntityTransformPipe pipe);

        TEntity Run<TEntity>(TEntity entity) where TEntity : class, IEntity;
    }
}
