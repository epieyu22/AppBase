using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Systems.JulianaCloud.Domain.Interfaces;
using Systems.JulianaCloud.Interfaces.Business.Utilities.Domain;

namespace Systems.JulianaCloud.Business.Utilities.Domain
{
    public class EntityTransformationPipeline : IEntityTransformationPipeline
    {
        private Lazy<List<IEntityTransformPipe>> pipes;

        public EntityTransformationPipeline()
        {
            this.pipes = new Lazy<List<IEntityTransformPipe>>(() => new List<IEntityTransformPipe>());
        }

        public void Register(IEntityTransformPipe pipe)
        {
            this.pipes.Value.Add(pipe);
        }

        public TEntity Run<TEntity>(TEntity entity) where TEntity : class, IEntity
        {
            foreach (IEntityTransformPipe pipe in this.pipes.Value)
            {
                entity = pipe.Transform(entity);
            }

            return entity;
        }
    }
}
