
using System.Linq;
using Systems.JulianaCloud.Interfaces.Business.Utilities.Identity;
using Systems.JulianaCloud.Interfaces.Data;

namespace Systems.JulianaCloud.Business.Utilities.Identity
{
    public class TotalEmployeesService : ITotalEmployeesService
    {
        #region Denpendences

        private readonly IUnitOfWork unitOfWork;

        #endregion

        #region Constructor
        
        public TotalEmployeesService(IUnitOfWork unitOfWork)
        {
            this.unitOfWork = unitOfWork;
        } 
        
        #endregion

        #region Public Methods

        public int GetTotalEmployees(short key)      
        {
            //int AfiliatesCount = (
            //    from employee in Employees
            //    where !employee.Estado = "R" && employee.Cod_Arp = key
            //    select employee
            //).Count();

            return 100;
        }

        #endregion
    }
}
