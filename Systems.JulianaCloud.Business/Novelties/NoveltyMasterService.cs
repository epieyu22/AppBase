using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Systems.JulianaCloud.Commons.Utils;
using Systems.JulianaCloud.Domain.Novelty;
using Systems.JulianaCloud.Interfaces.Business.Novelties;
using Systems.JulianaCloud.Interfaces.Data;
using Systems.JulianaCloud.Resources;

namespace Systems.JulianaCloud.Business.Novelties
{
    public class NoveltyMasterService : INoveltyMasterService
    {
        #region Dependencies

        private readonly IUnitOfWork unitOfWork;

        #endregion

        #region Constructor

        public NoveltyMasterService(IUnitOfWork unitOfWork)
        {
            this.unitOfWork = unitOfWork;
        }

        #endregion

        #region Public Methods

        public List<DateTime> GetPayrollDates()
        {
            var historicDates = this.unitOfWork.Repositories.Use<NoveltyHistoric>()
                        // Code to be converted to sql
                        .AsQuerable()
                            // select columns
                            .Select(nh => nh.PayrollDate)
                            // distinct
                            .Distinct()
                            // execute query and fetch data to NovletyHistoric objects
                            .ToList();

            var noveltiesDates = this.unitOfWork.Repositories.Use<Novelty>()
                        // Code to be converted to sql
                        .AsQuerable()
                            // select columns
                            .Select(nh => nh.Fec_Nomina)
                            // distinct
                            .Distinct()
                            // execute query and fetch data to NovletyHistoric objects
                            .ToList();

            return Enumerable.Concat(historicDates, noveltiesDates)
                        .Distinct()
                        // convert string date to real DateTime in C# objects
                        .Select(date => DateHelper.ConvertUglyDate(date, ValueConstants.DefaultDateStringFormat))
                        .ToList();
        }

        #endregion
    }
}
