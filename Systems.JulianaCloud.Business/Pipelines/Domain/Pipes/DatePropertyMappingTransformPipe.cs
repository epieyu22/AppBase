using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Reflection;
using System.Text;
using Systems.JulianaCloud.Business.Pipelines.Attributes;
using Systems.JulianaCloud.Commons.Utils;
using Systems.JulianaCloud.Domain.Attributes;
using Systems.JulianaCloud.Interfaces.Business.Pipelines.Shared.Pipes;
using Systems.JulianaCloud.Resources;

namespace Systems.JulianaCloud.Business.Pipelines.Domain.Pipes
{
    [Pipe(Qualifier = "DatePropertyMappingTransformPipe", UsedFor = PipeAttribute.Type.CreateAndUpdate | PipeAttribute.Type.Read)]
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
                Func<DateTime, object> fromDateMapper = (value) => {
                    return value.ToString(attr.Format, CultureInfo.InvariantCulture);
                };
                Func<string, object> fromStringMapper = (value) => DateHelper.ConvertUglyDate(value);

                if (!(prop.PropertyType == typeof(DateTime) || prop.PropertyType == typeof(DateTime?)))
                {
                    throw new InvalidOperationException(
                        string.Format(Messages.PropertyInvalidTypeForAttributeUsage, prop.Name, typeof(DatePropertyMappingAttribute).Name)
                    );
                }
                
                object value = prop.GetValue(entity);
                var targetProp = type.GetProperty(attr.Target);
                object targetValue = targetProp.GetValue(entity);

                if (attr.UseTargetOnNull && value == null)
                {
                    prop.SetValue(entity, fromStringMapper((string)targetValue));
                    continue;
                }

                targetProp.SetValue(entity, fromDateMapper((DateTime)prop.GetValue(entity)));
            }

            return entity;
        }
    }
}
