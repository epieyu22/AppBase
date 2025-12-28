using Microsoft.AspNetCore.Mvc;
using Systems.JulianaCloud.Domain;
using Systems.JulianaCloud.Interfaces.Business.Crud;
using Systems.JulianaCloud.TransferObjects;

namespace Systems.JulianaCloud.Api
{
    [Route("api/holidays")]
    [ApiController]
    public class HolidayController : BaseCrudController<HolidayTO, Holiday, short>
    {
        public HolidayController(IBasicCrudService<HolidayTO, Holiday, short> crudService) 
            : base(crudService)
        {
        }
    }
}