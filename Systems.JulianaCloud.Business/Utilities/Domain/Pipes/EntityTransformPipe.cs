using System;
using System.Collections.Generic;
using System.Text;
using Systems.JulianaCloud.Domain.Interfaces;
using Systems.JulianaCloud.Interfaces.Business.Utilities.Domain;

namespace Systems.JulianaCloud.Business.Utilities.Domain.Pipes
{
    public class EntityTransformPipe: IEntityTransformPipe
    {
        private readonly Func<IEntity, IEntity> transformer;

        public EntityTransformPipe(Func<IEntity, IEntity> transformer)
        {
            this.transformer = transformer;
        }

        public EntityTransformPipe(Action<IEntity> transformer)
        {
            this.transformer = data => {
                transformer(data);

                return data;
            };
        }

        public T Transform<T>(T entity) where T : class, IEntity
        {
            return (T) this.transformer?.Invoke(entity);
        }
    }
}
