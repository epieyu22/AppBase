using System;
using System.Collections.Generic;

namespace Systems.JulianaCloud.Interfaces.Business.Novelties
{
    public interface INoveltyMasterService
    {
        List<DateTime> GetPayrollDates();
    }
}