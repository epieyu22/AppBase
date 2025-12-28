using System;
using System.Linq.Expressions;
using Systems.JulianaCloud.Domain.Novelty;
using Systems.JulianaCloud.TransferObjects.Novelties;

namespace Systems.JulianaCloud.Interfaces.Business.Novelties.Reporting
{
    public interface INoveltiesReportFiltersBuilder
    {
        Expression<Func<NoveltyHistoric, bool>> buildFilters(NoveltiesReportFilters filters);
    }
}