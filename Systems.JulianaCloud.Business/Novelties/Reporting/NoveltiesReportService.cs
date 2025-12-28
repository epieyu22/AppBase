using AutoMapper;
using LinqKit;
using System;
using System.Collections.Generic;
using System.Globalization;
using System.Linq;
using System.Text;
using Systems.JulianaCloud.Domain;
using Systems.JulianaCloud.Domain.Novelty;
using Systems.JulianaCloud.Interfaces.Business.Novelties.Reporting;
using Systems.JulianaCloud.Interfaces.Data;
using Systems.JulianaCloud.Resources;
using Systems.JulianaCloud.TransferObjects.Novelties;

namespace Systems.JulianaCloud.Business.Novelties.Reporting
{
    public class NoveltiesReportService : INoveltiesReportService
    {
        #region Dependencies

        private readonly IUnitOfWork unitOfWork;
        private readonly IMapper mapper;
        private readonly INoveltiesReportFiltersBuilder noveltiesReportFiltersBuilder;

        #endregion

        #region Constructor

        public NoveltiesReportService(IUnitOfWork unitOfWork, IMapper mapper, INoveltiesReportFiltersBuilder noveltiesReportFiltersBuilder)
        {
            this.unitOfWork = unitOfWork;
            this.mapper = mapper;
            this.noveltiesReportFiltersBuilder = noveltiesReportFiltersBuilder;
            this.unitOfWork.Initialize();
        }

        #endregion

        #region Public Methods

        public List<NoveltyHistoricTO> GetNovelties(NoveltiesReportFilters filters)
        {
            var repo = this.unitOfWork.Repositories.Use<NoveltyHistoric>();
            var query = repo.AsQuerable();

            query = query.Where(noveltiesReportFiltersBuilder.buildFilters(filters))
                        .OrderBy(n => n.PayrollDate);


            //if (filters.EnablePagination)
            //{
            //    query = query.Skip(filters.Page * filters.PageSize)
            //                 .Take(filters.PageSize);
            //}

            return this.mapper.Map<List<NoveltyHistoricTO>>(query.ToList());
        }

        #endregion

    }
}
