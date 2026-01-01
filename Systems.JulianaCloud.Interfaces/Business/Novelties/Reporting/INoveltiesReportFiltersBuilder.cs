using System;
using System.Linq.Expressions;
// using Systems.JulianaCloud.Domain.Novelty; // Commented out - namespace doesn't exist in Domain project
using Systems.JulianaCloud.TransferObjects.Novelties;

namespace Systems.JulianaCloud.Interfaces.Business.Novelties.Reporting
{
    public interface INoveltiesReportFiltersBuilder
    {
        // Expression<Func<NoveltyHistoric, bool>> buildFilters(NoveltiesReportFilters filters); // Commented out - NoveltyHistoric type not found
        // TODO: Restore this when NoveltyHistoric class is added to Domain project
    }
}
