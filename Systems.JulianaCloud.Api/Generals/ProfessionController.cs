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
    [Route("api/professions")]
    [ApiController]
    public class ProfessionController : BaseCrudController<ProfessionTO, Profession, short>
    {
        public ProfessionController(IBasicCrudService<ProfessionTO, Profession, short> crudService) 
            : base(crudService)
        {
        }

    }
}
