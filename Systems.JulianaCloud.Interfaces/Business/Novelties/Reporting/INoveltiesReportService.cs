using System.Collections.Generic;
using Systems.JulianaCloud.TransferObjects.Novelties;

namespace Systems.JulianaCloud.Interfaces.Business.Novelties.Reporting
{
    public interface INoveltiesReportService
    {
        List<NoveltyHistoricTO> GetNovelties(NoveltiesReportFilters filters);
    }
}