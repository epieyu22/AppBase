using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using Systems.JulianaCloud.Domain;
using Systems.JulianaCloud.Interfaces.Business.Crud;
using Systems.JulianaCloud.TransferObjects;

namespace Systems.JulianaCloud.Api
{
    [Route("api/cities")]
    [ApiController]
    public class CityController : BaseCrudController<CityTO, City, short>
    {
        
        public CityController(ICityService crudService) 
            : base(crudService)
        {
        }

        [HttpGet]
        [Route("by-department/{departmentKey}")]
        public List<CityTO> GetByDepartment(short departmentKey)
        {
            return ((ICityService)this.crudService).GetByDepartmentKey(departmentKey);
        }
    }
}