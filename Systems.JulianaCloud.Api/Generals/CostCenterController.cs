using Microsoft.AspNetCore.Mvc;
using Systems.JulianaCloud.Domain;
using Systems.JulianaCloud.Interfaces.Business.Crud;
using Systems.JulianaCloud.TransferObjects;

namespace Systems.JulianaCloud.Api
{
    [Route("api/costcenters")]
    [ApiController]
    public class CostCenterController : BaseCrudController<CostCenterTO, CostCenter, short>
    {
        public CostCenterController(IBasicCrudService<CostCenterTO, CostCenter, short> crudService) 
            : base(crudService)
        {
        }
    }
}