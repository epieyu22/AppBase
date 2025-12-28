using Microsoft.AspNetCore.Mvc;
using Systems.JulianaCloud.Domain.Generals;
using Systems.JulianaCloud.Interfaces.Business.Crud;
using Systems.JulianaCloud.TransferObjects.Generals;

namespace Systems.JulianaCloud.Api
{
    [Route("api/branchoffice")]
    [ApiController]
    public class BranchOfficeController : BaseCrudController<BranchOfficeTO, BranchOffice, short>
    {
        public BranchOfficeController(IBasicCrudService<BranchOfficeTO, BranchOffice, short> crudService) 
            : base(crudService)
        {
        }
    }
}