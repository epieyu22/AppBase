using System;
using System.Linq.Expressions;
using Systems.JulianaCloud.TransferObjects.Interfaces.Lambda;

namespace Systems.JulianaCloud.Interfaces.Business.Utilities.Lambda
{
    public interface ILambdaBuilder
    {
        Expression<Func<T, bool>> Build<T>(string propertyName, object inputValue, Condition condition);
    }
}