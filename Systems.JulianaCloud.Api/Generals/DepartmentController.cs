using Microsoft.AspNetCore.Mvc;
using Systems.JulianaCloud.Domain;
using Systems.JulianaCloud.Interfaces.Business.Crud;
using Systems.JulianaCloud.TransferObjects;

namespace Systems.JulianaCloud.Api
{
    [Route("api/departments")]
    [ApiController]
    public class DepartmentController : BaseCrudController<DepartmentTO, Department, short>
    {
        public DepartmentController(IBasicCrudService<DepartmentTO, Department, short> crudService) 
            : base(crudService)
        {
        }
    }
}