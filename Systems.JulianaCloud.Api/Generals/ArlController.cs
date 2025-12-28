using Microsoft.AspNetCore.Mvc;
using Systems.JulianaCloud.Domain;
using Systems.JulianaCloud.Interfaces.Business.Crud;
using Systems.JulianaCloud.TransferObjects;

namespace Systems.JulianaCloud.Api
{
    [Route("api/arl")]
    [ApiController]
    public class ArlController : BaseCrudController<ArlTO, Arl, short>
    {
        public ArlController(IBasicCrudService<ArlTO, Arl, short> crudService) 
            : base(crudService)
        {
        }
    }
}