using System.Collections.Generic;
using Systems.JulianaCloud.Domain.Interfaces;
using Systems.JulianaCloud.TransferObjects.Interfaces.Lambda;

namespace Systems.JulianaCloud.Interfaces.Business.Crud
{
    public interface IBasicCrudService<TEntityTO, TEntityDomain, TKey> 
        where TEntityDomain : class, IKeyEntity<TKey>
        where TEntityTO : class, IKeyEntity<TKey>
    {
        void Create(TEntityTO source);

        void Update(TEntityTO source);

        void Delete(TKey key);

        List<TEntityTO> GetAll();

        TEntityTO GetOne(TKey key);
        List<TEntityTO> GetByProperty(IPropertyCondition propCondition);
    }
}
