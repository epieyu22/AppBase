using System;
using System.Collections.Generic;
using System.Text;
using Systems.JulianaCloud.TransferObjects.Authentication;

namespace Systems.JulianaCloud.Interfaces.Business.Authentication
{
    public interface IAuthService
    {
        AppUserTO PrimaryLogin(string email, ref string message);

        UserTO SecondaryLogin(string code, string company, string email, string password, ref string message);

        object GenerateAccessToken(short code, string company, object user, ref string message);

        AppUserTO GetUserInfo(string token);
    }
}
