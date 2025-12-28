using System;
using System.Collections.Generic;
using System.Text;
using Systems.JulianaCloud.Domain.Interfaces;

namespace Systems.JulianaCloud.Interfaces.Business.Utilities.Domain
{
    public interface IEntityTransformPipe
    {
        TEntity Transform<TEntity>(TEntity entity) where TEntity : class, IEntity;
    }
}
