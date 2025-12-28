using System;
using System.Linq;
using System.Reflection;
using Systems.JulianaCloud.Domain.Attributes;
using Systems.JulianaCloud.Domain.Interfaces;
using Systems.JulianaCloud.Interfaces.Business.Utilities.Domain;

namespace Systems.JulianaCloud.Business.Utilities.Domain.Pipes
{
    public class BooleanPropertyMappingTransformPipe : IEntityTransformPipe
    {
        #region Public Methods

        public TEntity Transform<TEntity>(TEntity entity) where TEntity : class, IEntity
        {
            var type = entity.GetType();
            var props = type.GetProperties()
                                .Where(property =>
                                    property.GetCustomAttribute<BooleanPropertyMappingAttribute>() != null)
                                .ToList();

            foreach (var prop in props)
            {
                var attr = prop.GetCustomAttribute<BooleanPropertyMappingAttribute>();
                var mapper = buildMapper(attr);
                type.GetProperty(attr.Target).SetValue(entity, mapper(prop.GetValue(entity)));
            }

            return entity;
        }

        #endregion

        #region Private Methods

        private Func<object, object> buildMapper(BooleanPropertyMappingAttribute booleanPropertyMapping)
        {
            return (value) => Equals(value, true) ? booleanPropertyMapping.TrueValue : booleanPropertyMapping.FalseValue;
        }

        #endregion

    }
}
