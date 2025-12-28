using System;
using System.Collections.Generic;
using System.Diagnostics;
using System.Text;
using Systems.JulianaCloud.Interfaces.Business;

namespace Systems.JulianaCloud.Business
{
    public class PayrollBO : IPayrollBO
    {
        public void DoSomething()
        {
            Debug.WriteLine("Hello from PayrollBO");
        }
    }
}
