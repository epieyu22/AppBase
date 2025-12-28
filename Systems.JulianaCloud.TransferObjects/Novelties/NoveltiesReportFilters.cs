using System;
using System.Collections.Generic;
using System.Text;

namespace Systems.JulianaCloud.TransferObjects.Novelties
{
    public class NoveltiesReportFilters
    {
        public List<DateTime> PayrollDateRange { get; set; }

        public short? EmployeeCode { get; set; }
        
        public string? Status { get; set; }

        // public bool EnablePagination { get; set; }

        // public int Page { get; set; }

        // public int PageSize { get; set; }
    }
}
