using System;
using Systems.JulianaCloud.Interfaces.Business.Utilities.Identity;

namespace Systems.JulianaCloud.Business.Utilities.Identity
{
    public class DigitVerificationService : IDigitVerificationService
    {
        #region Constants
   
        private const string Digit = "71675953474341372923191713 7 3";

        #endregion

        #region Public Methods

        public int GetVerificationDigit(string nit)         
        {
            string nitTemp = "";
            int verificationDigit = 0, index;

            for (index =0; index <= 14 - nit.Length; index++)
            {
                nitTemp += "0";
            }
            nit = nitTemp + nit;

            for(index=1; index <= nit.Length; index++)
            {
                verificationDigit += Convert.ToInt32(Digit.Substring((index * 2 - 2), 2)) * Convert.ToInt32(nit.Substring(index -1, 1));
            }
            verificationDigit %= 11;

            if (verificationDigit > 1)
                verificationDigit = 11 - verificationDigit;

            return verificationDigit;
        }

        #endregion
    }
}
