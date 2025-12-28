using System;
using System.Linq.Expressions;
using Systems.JulianaCloud.Interfaces.Business.Utilities.Lambda;
using Systems.JulianaCloud.TransferObjects.Interfaces.Lambda;

namespace Systems.JulianaCloud.Business.Utilities.Lambda
{
    public class LambdaBuilder : ILambdaBuilder
    {
        public Expression<Func<T, bool>> Build<T>(string propertyName, object inputValue, Condition condition)
        {

            var item = Expression.Parameter(typeof(T), "p");
            var prop = Expression.Property(item, propertyName);
            var propertyInfo = typeof(T).GetProperty(propertyName);
            var value = Expression.Constant(Convert.ChangeType(inputValue, propertyInfo.PropertyType));

            BinaryExpression equal;

            switch (condition)
            {
                case Condition.Equal:
                    equal = Expression.Equal(prop, value);
                    break;

                case Condition.Greaterthan:
                    equal = Expression.GreaterThan(prop, value);
                    break;

                case Condition.GreaterThanOrEqual:
                    equal = Expression.GreaterThanOrEqual(prop, value);
                    break;

                case Condition.LessThan:
                    equal = Expression.LessThan(prop, value);
                    break;

                case Condition.LessThanOrEqual:
                    equal = Expression.LessThanOrEqual(prop, value);
                    break;

                default:
                    equal = Expression.Equal(prop, value);
                    break;
            }
            var lambda = Expression.Lambda<Func<T, bool>>(equal, item);

            return lambda;
        }
    }
}
