using Microsoft.AspNetCore.Mvc;
using Systems.JulianaCloud.Domain;
using Systems.JulianaCloud.Interfaces.Business.Crud;
using Systems.JulianaCloud.TransferObjects;

namespace Systems.JulianaCloud.Api
{
    [Route("api/cajas")]
    [ApiController]
    public class CajaController : BaseCrudController<CajaTO, Caja, short>
    {
        public CajaController(IBasicCrudService<CajaTO, Caja, short> crudService) 
            : base(crudService)
        {
        }
    }
}