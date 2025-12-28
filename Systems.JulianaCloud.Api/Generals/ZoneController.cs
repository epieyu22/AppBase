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
    [Route("api/zones")]
    [ApiController]
    public class ZoneController : BaseCrudController<ZoneTO, Zone, short>
    {
        public ZoneController(IBasicCrudService<ZoneTO, Zone, short> crudService) 
            : base(crudService)
        {
        }

    }
}
