using Microsoft.AspNetCore.Mvc;
using Systems.JulianaCloud.Interfaces.Business.Utilities.Identity;

namespace Systems.JulianaCloud.Api
{
    [Route("api/verificationdigit")]
    [ApiController]
    public class VerificationDigitController
    {
        private readonly IDigitVerificationService digitVerificationService;
        public VerificationDigitController(
            IDigitVerificationService digitVerificationService)
        {
            this.digitVerificationService = digitVerificationService;
        }

        [HttpGet]
        [Route("{nit}/verification-digit")]
        public int GetByDigVer(string nit)
        {
            return this.digitVerificationService.GetVerificationDigit(nit);
        }
    }
}