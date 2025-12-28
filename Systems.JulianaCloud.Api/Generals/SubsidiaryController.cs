using Microsoft.AspNetCore.Mvc;
using Systems.JulianaCloud.Domain.Generals;
using Systems.JulianaCloud.Interfaces.Business.Crud;
using Systems.JulianaCloud.TransferObjects.Generals;

namespace Systems.JulianaCloud.Api
{
    [Route("api/subsidiaries")]
    [ApiController]
    public class SubsidiaryController : BaseCrudController<SubsidiaryTO, Subsidiary, short>
    {
        public SubsidiaryController(IBasicCrudService<SubsidiaryTO, Subsidiary, short> crudService) 
            : base(crudService)
        {
        }
    }
}