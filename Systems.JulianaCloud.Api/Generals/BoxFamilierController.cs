using Microsoft.AspNetCore.Mvc;
using Systems.JulianaCloud.Domain;
using Systems.JulianaCloud.Interfaces.Business.Crud;
using Systems.JulianaCloud.TransferObjects;

namespace Systems.JulianaCloud.Api
{
    [Route("api/boxesfamiliers")]
    [ApiController]
    public class BoxFamilierController : BaseCrudController<BoxFamilierTO, BoxFamilier, short>
    {
        public BoxFamilierController(IBasicCrudService<BoxFamilierTO, BoxFamilier, short> crudService) 
            : base(crudService)
        {
        }
    }
}