using Microsoft.AspNetCore.Mvc;
using Systems.JulianaCloud.Interfaces.Business.Utilities.Identity;

namespace Systems.JulianaCloud.Api
{
    [Route("api/totalemployees")]
    [ApiController]
    public class TotalEmployeesController
    {
        private readonly ITotalEmployeesService totalEmployeesService;
        public TotalEmployeesController(
            ITotalEmployeesService totalEmployeesService)
        {
            this.totalEmployeesService = totalEmployeesService;
        }

        [HttpGet]
        [Route("{key}/total-employees")]
        public int GetByTotEmp(short key)
        {
            return this.totalEmployeesService.GetTotalEmployees(key);
        }
    }
}
