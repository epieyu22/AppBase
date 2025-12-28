using System.Collections.Generic;
using Systems.JulianaCloud.Domain;
using Systems.JulianaCloud.TransferObjects;

namespace Systems.JulianaCloud.Interfaces.Business.Crud
{
    public interface ICityService : IBasicCrudService<CityTO, City, short>
    {
        List<CityTO> GetByDepartmentKey(short departmentKey);
    }
}