using AutoMapper;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Text;
using Systems.JulianaCloud.Domain;
using Systems.JulianaCloud.Interfaces.Business.Crud;
using Systems.JulianaCloud.Interfaces.Business.Utilities.Domain;
using Systems.JulianaCloud.Interfaces.Business.Utilities.Lambda;
using Systems.JulianaCloud.Interfaces.Data;
using Systems.JulianaCloud.TransferObjects;

namespace Systems.JulianaCloud.Business.Crud
{
    public class CityService : BasicCrudService<CityTO, City, short>, ICityService
    {
        public CityService(IUnitOfWork unitOfWork, IMapper mapper, ILambdaBuilder lambdaBuilder, IEntityTransformationPipeline entityTransformationPipeline) :
            base(unitOfWork, mapper, lambdaBuilder, entityTransformationPipeline)
        {
        }

        #region Custom queries

        public List<CityTO> GetByDepartmentKey(short departmentKey)
        {
            string departmentCode = this.unitOfWork.Repositories.Use<Department>().FindSingle(d => d.Key == departmentKey)?.CodDane;

            return this.mapper.Map<List<CityTO>>(
                this.mainRepository.Find(c => c.CodDepto == departmentCode).ToList()
            );
        }

        #endregion


    }
}
