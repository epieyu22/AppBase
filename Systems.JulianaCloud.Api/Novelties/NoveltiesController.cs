using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Text;
using Systems.JulianaCloud.Business.Novelties.Reporting;
using Systems.JulianaCloud.Interfaces.Business.Novelties;
using Systems.JulianaCloud.Interfaces.Business.Novelties.Reporting;
using Systems.JulianaCloud.TransferObjects.Novelties;

namespace Systems.JulianaCloud.Api.Novelties
{
    [Route("api/novelties")]
    [ApiController]
    public class NoveltiesController : ControllerBase
    {
        private readonly INoveltiesReportService noveltiesReportService;
        private readonly INoveltyMasterService noveltyMasterService;

        public NoveltiesController(INoveltiesReportService noveltiesReportService, INoveltyMasterService noveltyMasterService)
        {
            this.noveltiesReportService = noveltiesReportService;
            this.noveltyMasterService = noveltyMasterService;
        }

        [HttpPut]
        [Route("")]
        // GET api/novelties
        public List<NoveltyHistoricTO> GetNovelties([FromBody] NoveltiesReportFilters filters)
        {
            return this.noveltiesReportService.GetNovelties(filters);
        }


        [HttpGet]
        [Route("payroll-dates")]
        // GET api/novelties/payroll-dates
        public List<DateTime> GetPayrollDates()
        {
            return this.noveltyMasterService.GetPayrollDates(); 
        }
    }
}
