using System;
using System.Collections.Generic;
using System.Linq;
using System.Reflection;
using System.Text;
using Systems.JulianaCloud.Domain.Attributes;
using Systems.JulianaCloud.Interfaces.Business.Utilities.Domain;
using Systems.JulianaCloud.Resources;

namespace Systems.JulianaCloud.Business.Utilities.Domain.Pipes
{
    public class DatePropertyMappingTransformPipe : IEntityTransformPipe
    {
        TEntity IEntityTransformPipe.Transform<TEntity>(TEntity entity)
        {
            var type = entity.GetType();
            var props = type.GetProperties()
                                .Where(property =>
                                    property.GetCustomAttribute<DatePropertyMappingAttribute>() != null)
                                .ToList();

            foreach (var prop in props)
            {
                var attr = prop.GetCustomAttribute<DatePropertyMappingAttribute>();

                if (!(prop.PropertyType == typeof(DateTime) || prop.PropertyType == typeof(DateTime?)))
                {
                    throw new InvalidOperationException(
                        string.Format(Messages.PropertyInvalidTypeForAttributeUsage, prop.Name, typeof(DatePropertyMappingAttribute).Name)
                    );
                }

                Func<DateTime, object> mapper = (DateTime value) => value.ToString(attr.Format);
                type.GetProperty(attr.Target).SetValue(entity, mapper((DateTime) prop.GetValue(entity)));
            }

            return entity;
        }
    }
}
