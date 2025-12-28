using AutoMapper;
using Microsoft.AspNetCore.Mvc;
using System.Collections.Generic;
using System.Linq;
using Systems.JulianaCloud.Domain.Employee;
using Systems.JulianaCloud.Interfaces.Business.Crud;
using Systems.JulianaCloud.Interfaces.Data;
using Systems.JulianaCloud.TransferObjects.Employee;

namespace Systems.JulianaCloud.Api
{
    [Route("api/employee-positions")]
    [ApiController]
    public class PositionController : BaseCrudController<PositionTO, Position, short>
    {
        public PositionController(IBasicCrudService<PositionTO, Position, short> crudService) 
            : base(crudService)
        {
        }

    }
}
