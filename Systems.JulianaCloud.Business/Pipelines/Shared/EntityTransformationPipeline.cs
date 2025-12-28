using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Systems.JulianaCloud.Domain.Interfaces;
using Systems.JulianaCloud.Interfaces.Business.Pipelines.Shared;
using Systems.JulianaCloud.Interfaces.Business.Pipelines.Shared.Pipes;

namespace Systems.JulianaCloud.Business.Pipelines.Shared
{
    public class EntityTransformationPipeline : IEntityTransformationPipeline
    {
        private Lazy<List<IEntityTransformPipe>> pipes;

        public EntityTransformationPipeline()
        {
            pipes = new Lazy<List<IEntityTransformPipe>>(() => new List<IEntityTransformPipe>());
        }

        public IEntityTransformationPipeline Register(IEntityTransformPipe pipe)
        {
            pipes.Value.Add(pipe);

            return this;
        }

        public TEntity Run<TEntity>(TEntity entity) where TEntity : class, IEntity
        {
            foreach (IEntityTransformPipe pipe in pipes.Value)
            {
                entity = pipe.Transform(entity);
            }

            return entity;
        }
    }
}
