using Microsoft.AspNetCore.Mvc;
using Systems.JulianaCloud.Domain;
using Systems.JulianaCloud.Interfaces.Business.Crud;
using Systems.JulianaCloud.TransferObjects;

namespace Systems.JulianaCloud.Api
{
    [Route("api/risks")]
    [ApiController]
    public class RiskController : BaseCrudController<RiskTO, Risk, short>
    {
        public RiskController(
            IBasicCrudService<RiskTO, Risk, short> crudService) 
            : base(crudService)
        {
        }
    }
}