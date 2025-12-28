using Microsoft.AspNetCore.Authorization;
using Microsoft.AspNetCore.Mvc;
using System;
using System.Collections.Generic;
using System.Text;
using Systems.JulianaCloud.Business.Authentication;
using Systems.JulianaCloud.Interfaces.Business.Authentication;
using Systems.JulianaCloud.TransferObjects.Authentication;

namespace Systems.JulianaCloud.Api.Authentication
{
    [Route("api/security")]
    [ApiController]
    [Authorize]
    public class SecurityController : ControllerBase
    {
        private readonly ISecurityService securityService;

        public SecurityController(ISecurityService securityService)
        {
            this.securityService = securityService;
        }

        [HttpGet]
        [Route("permission/{option}")]
        public ActionResult Get()
        {
            //SELECT * FROM
            //            PERMISOS INNER JOIN OPCIONES ON(PERMISOS.Cod_Opcion = OPCIONES.Cod_Opcion)
            //WHERE Cod_Usuario = '3' AND Opcion = 'Conceptos'
            var code = ((AppUserTO)AuthService.UserInfo(Request.Headers["Authorization"])).Key;
            return Ok();
        }
    }
}
