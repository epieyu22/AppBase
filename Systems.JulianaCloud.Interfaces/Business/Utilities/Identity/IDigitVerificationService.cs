using System;
using System.Collections.Generic;
using System.Text;
using Systems.JulianaCloud.Domain;
using Systems.JulianaCloud.TransferObjects;

namespace Systems.JulianaCloud.Interfaces.Business.Utilities.Identity
{
    public interface IDigitVerificationService
    {
        int GetVerificationDigit(string nit);   
    }
}
    