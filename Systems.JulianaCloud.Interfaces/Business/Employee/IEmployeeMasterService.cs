using System.Collections.Generic;
using Systems.JulianaCloud.TransferObjects.Employee;

namespace Systems.JulianaCloud.Interfaces.Business.Employee
{
    public interface IEmployeeMasterService
    {
        List<EmployeeTO> GetEmployees(EmployeeTO filters);
    }
}