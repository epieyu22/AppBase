using Microsoft.AspNetCore.Mvc;
using Systems.JulianaCloud.TransferObjects.Authentication;
using Systems.JulianaCloud.Interfaces.Business.Crud;
using Systems.JulianaCloud.Domain.Authentication;
using Systems.JulianaCloud.Interfaces.Business.Authentication;
using Microsoft.AspNetCore.Authorization;
using System.ComponentModel.DataAnnotations;

namespace Systems.JulianaCloud.Api.Authentication
{
    [Route("api/auth")]
    [ApiController]
    public class AuthController : ControllerBase
    {
        private readonly IAuthService authService;
        public AuthController(IAuthService authService)
        {
            this.authService = authService;
        }

        [HttpPost]
        [Route("login")]
        public IActionResult Login(LoginRequest request)
        {
            string message = "";
            UserTO user = null;
            AppUserTO appUser = (AppUserTO)authService.PrimaryLogin(request.Email, ref message);

            if (string.IsNullOrEmpty(message)) 
                user = (UserTO)authService.SecondaryLogin(appUser.CompanyCode.ToString(), appUser.Company, request.Email, request.Password, ref message);

            if (string.IsNullOrEmpty(message))
            {
                var response = authService.GenerateAccessToken(appUser.CompanyCode, appUser.Company, user, ref message);
                if (response != null)
                    return Ok(response);
            }

            return BadRequest(new { message = message });
        }

        [Authorize]
        [HttpPost]
        [Route("info")]
        public IActionResult Info()
        {
            return Ok(authService.GetUserInfo(Request.Headers["Authorization"]));
        }
    }

    public class LoginRequest
    {
        [Required]
        [DataType(DataType.EmailAddress)]
        public string Email { get; set; }
        [Required]
        [DataType(DataType.Password)]
        public string Password { get; set; }
    }
}
