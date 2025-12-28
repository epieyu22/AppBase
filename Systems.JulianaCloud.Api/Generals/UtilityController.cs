using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using Systems.JulianaCloud.Domain;
using Systems.JulianaCloud.Domain.Generals;
using Systems.JulianaCloud.Interfaces.Business.Crud;
using Systems.JulianaCloud.TransferObjects.Generals;

namespace Systems.JulianaCloud.Api.Generals
{
    [Route("api/utilities")]
    [ApiController]
    public class UtilityController : BaseCrudController<UtilityTO, Utility, short>
    {
        public UtilityController(IBasicCrudService<UtilityTO, Utility, short> crudService)
            : base(crudService)
        {
        }
    }
}
