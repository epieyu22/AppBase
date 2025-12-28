using Microsoft.AspNetCore.Mvc;
using Systems.JulianaCloud.Domain;
using Systems.JulianaCloud.Interfaces.Business.Crud;
using Systems.JulianaCloud.TransferObjects;

namespace Systems.JulianaCloud.Api
{
    [Route("api/companies")]
    [ApiController]
    public class CompanyController : BaseCrudController<CompanyTO, Company, short>
    {
        public CompanyController(IBasicCrudService<CompanyTO, Company, short> crudService) 
            : base(crudService)
        {
        }
    }
}
