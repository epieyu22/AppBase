using Microsoft.AspNetCore.Mvc;
using Systems.JulianaCloud.Domain;
using Systems.JulianaCloud.Interfaces.Business.Crud;
using Systems.JulianaCloud.TransferObjects;

namespace Systems.JulianaCloud.Api
{
    [Route("api/health")]
    [ApiController]
    public class HealthController : BaseCrudController<HealthTO, Health, short>
    {
        public HealthController(IBasicCrudService<HealthTO, Health, short> crudService) 
            : base(crudService)
        {
        }
    }
}
