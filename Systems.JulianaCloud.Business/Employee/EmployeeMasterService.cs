using AutoMapper;
using LinqKit;
using System;
using System.Collections.Generic;
using System.Linq;
using System.Linq.Expressions;
using System.Text;
using Systems.JulianaCloud.Interfaces.Business.Employee;
using Systems.JulianaCloud.Interfaces.Data;
using Systems.JulianaCloud.TransferObjects.Employee;


namespace Systems.JulianaCloud.Business.Employee
{
    public class EmployeeMasterService : IEmployeeMasterService
    {
        private readonly IUnitOfWork unitOfWork;
        private readonly IMapper mapper;

        #region Constructor

        public EmployeeMasterService(IUnitOfWork unitOfWork, IMapper mapper)
        {
            this.unitOfWork = unitOfWork;
            this.mapper = mapper;
            this.unitOfWork.Initialize();
        }

        #endregion

        #region Public Methods

        public List<EmployeeTO> GetEmployees(EmployeeTO filters)
        {
            return this.mapper.Map<List<EmployeeTO>>(
                this.unitOfWork.Repositories.Use<Domain.Employee.Employee>().Find(BuildFilters(filters)).ToList()
            );
        }

        #endregion

        #region Private Methods

        private Expression<Func<Domain.Employee.Employee, bool>> BuildFilters(EmployeeTO filters)
        {
            var where = PredicateBuilder.New<Domain.Employee.Employee>(true);

            if (filters == null)
                return where;

            if (!filters.Code.HasValue)
            {
                where = where.And(n => n.Cod_Empleado.ToString().Contains(filters.Code.ToString()));
            }

            if (!string.IsNullOrWhiteSpace(filters.Name))
            {
                where = where.And(n => n.Empleado.ToLower().Contains(filters.Name.ToLower()));
            }

            if (!string.IsNullOrWhiteSpace(filters.IdentificationNumber))
            {
                where = where.And(n => n.Cedula.Contains(filters.IdentificationNumber));
            }

            return where;
        }

        #endregion
    }
}
