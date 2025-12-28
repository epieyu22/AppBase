using System;
using System.Collections.Generic;
using System.Text;
using Systems.JulianaCloud.Domain.Interfaces;

namespace Systems.JulianaCloud.Interfaces.Business.Utilities.Domain
{
    public interface IEntityTransformationPipeline
    {
        void Register(IEntityTransformPipe pipe);

        TEntity Run<TEntity>(TEntity entity) where TEntity : class, IEntity;
    }
}
