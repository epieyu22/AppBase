using LinqKit;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using Systems.JulianaCloud.Domain.Novelty;
using Systems.JulianaCloud.Interfaces.Business.Novelties.Reporting;
using Systems.JulianaCloud.Resources;
using Systems.JulianaCloud.TransferObjects.Novelties;

namespace Systems.JulianaCloud.Business.Novelties.Reporting
{
    public class NoveltiesReportFiltersBuilder : INoveltiesReportFiltersBuilder
    {
        #region Public Methods

        public Expression<Func<NoveltyHistoric, bool>> buildFilters(NoveltiesReportFilters filters)
        {
            var where = PredicateBuilder.New<NoveltyHistoric>(true);

            if (filters == null)
                return where;

            if (filters.PayrollDateRange.Any() && filters.PayrollDateRange.Count == 2)
            {
                string startDate = filters.PayrollDateRange[0].ToString(ValueConstants.DefaultDateStringFormat, CultureInfo.InvariantCulture);
                string endDate = filters.PayrollDateRange[1].ToString(ValueConstants.DefaultDateStringFormat, CultureInfo.InvariantCulture);

                where = where.And(n => n.PayrollDate.CompareTo(startDate) >= 0 && n.PayrollDate.CompareTo(endDate) <= 0);
            }

            if (filters.EmployeeCode.HasValue)
            {
                where = where.And(n => n.EmployeeCode == filters.EmployeeCode);
            }

            //if (filters.Status.Hasalue)
            //{
            //    where = where.And(n => n.Status == filters.Status);
            //}

            return where;
        }

        #endregion
    }
}
