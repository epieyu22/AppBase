using System;
using System.Linq;
using System.Reflection;
using Systems.JulianaCloud.Business.Pipelines.Attributes;
using Systems.JulianaCloud.Domain.Attributes;
using Systems.JulianaCloud.Domain.Interfaces;
using Systems.JulianaCloud.Interfaces.Business.Pipelines.Shared.Pipes;

namespace Systems.JulianaCloud.Business.Pipelines.Domain.Pipes
{
    [Pipe(Qualifier = "BooleanPropertyMappingTransformPipe", UsedFor = PipeAttribute.Type.CreateAndUpdate | PipeAttribute.Type.Read)]
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
                var mapper = buildFromBooleanMapper(attr);

                object value = prop.GetValue(entity);
                var targetProp = type.GetProperty(attr.Target);
                object targetValue = targetProp.GetValue(entity);

                if (attr.UseTargetOnNull && value == null)
                {
                    prop.SetValue(entity, buildFromStringMapper(attr)((string)targetValue));
                    continue;
                }

                targetProp.SetValue(entity, mapper(prop.GetValue(entity)));
            }

            return entity;
        }

        #endregion

        #region Private Methods

        private Func<object, object> buildFromBooleanMapper(BooleanPropertyMappingAttribute booleanPropertyMapping)
        {
            return (value) => Equals(value, true) ? booleanPropertyMapping.TrueValue : booleanPropertyMapping.FalseValue;
        }

        private Func<object, object> buildFromStringMapper(BooleanPropertyMappingAttribute booleanPropertyMapping)
        {
            return (value) => value != null ? value : value == booleanPropertyMapping.TrueValue;
        }

        #endregion

    }
}
