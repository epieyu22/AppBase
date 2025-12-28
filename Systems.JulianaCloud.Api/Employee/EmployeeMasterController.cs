using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Text;
using Systems.JulianaCloud.Interfaces.Business.Employee;
using Systems.JulianaCloud.Resources;
using Systems.JulianaCloud.TransferObjects.Employee;

namespace Systems.JulianaCloud.Api.Employee
{
    [Route("api/employee-masters")]
    [ApiController]
    public class EmployeeMasterController : ControllerBase
    {
        private readonly IEmployeeMasterService employeeMasterService;

        public EmployeeMasterController(IEmployeeMasterService employeeMasterService)
        {
            this.employeeMasterService = employeeMasterService;
        }

        [HttpPut]
        [Route("employees")]
        public List<EmployeeTO> GetEmployees([FromBody] EmployeeTO filters)
        {
            return this.employeeMasterService.GetEmployees(filters);
        }
    }
}
