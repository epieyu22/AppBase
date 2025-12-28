using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Linq;
using Systems.JulianaCloud.Domain;
using Systems.JulianaCloud.Domain.Employee;
using Systems.JulianaCloud.Interfaces.Business.Crud;
using Systems.JulianaCloud.Interfaces.Data;
using Systems.JulianaCloud.TransferObjects;
using Systems.JulianaCloud.TransferObjects.Employee;

namespace Systems.JulianaCloud.Api
{
    [Route("api/countries")]
    [ApiController]
    public class CountryController : BaseCrudController<CountryTO, Country, short>
    {
        public CountryController(IBasicCrudService<CountryTO, Country, short> crudService) 
            : base(crudService)
        {
        }

    }
}
