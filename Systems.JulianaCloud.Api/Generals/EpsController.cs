using Microsoft.AspNetCore.Mvc;
using Systems.JulianaCloud.Domain;
using Systems.JulianaCloud.Interfaces.Business.Crud;
using Systems.JulianaCloud.TransferObjects;

namespace Systems.JulianaCloud.Api
{
    [Route("api/eps")]
    [ApiController]
    public class EpsController : BaseCrudController<EpsTO, Eps, short>
    {
        public EpsController(IBasicCrudService<EpsTO, Eps, short> crudService) 
            : base(crudService)
        {
        }
    }
}
