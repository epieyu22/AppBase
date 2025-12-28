using AutoMapper;
using Microsoft.EntityFrameworkCore;
using Microsoft.Extensions.Configuration;
using Microsoft.IdentityModel.Tokens;
using System;
using System.IdentityModel.Tokens.Jwt;
using System.Linq;
using System.Security.Claims;
using Systems.JulianaCloud.Domain.Authentication;
using Systems.JulianaCloud.Interfaces.Business.Authentication;
using Systems.JulianaCloud.Interfaces.Business.Utilities.Lambda;
using Systems.JulianaCloud.Interfaces.Data;
using Systems.JulianaCloud.TransferObjects.Authentication;

namespace Systems.JulianaCloud.Business.Authentication
{
    public class AuthService : IAuthService
    {
        private readonly IConfiguration configuration;
        private readonly IUnitOfWork unitOfWork;
        private readonly IMapper mapper;
        private readonly ILambdaBuilder lambdaBuilder;
        private readonly IAppUserContext context;

        public AuthService(
            IConfiguration configuration,
            IUnitOfWork unitOfWork,
            IMapper mapper,
            ILambdaBuilder lambdaBuilder,
            IAppUserContext context
            )
        {
            this.configuration = configuration;
            this.unitOfWork = unitOfWork;
            this.mapper = mapper;
            this.lambdaBuilder = lambdaBuilder;
            this.context = context;
        }

        public AppUserTO PrimaryLogin(string email, ref string message)
        {
            var user = GetAppUserByEmail(email);
            if (user == null || user.State != "A")
            {
                message = "AUTH.USER_NOT_FOUND";
                return null;
            }
            return user;
        }

        public UserTO SecondaryLogin(string code, string company, string email, string password, ref string message)
        {
            //password = encrypt password;
            var user = GetUserByLogin(company, email, password);
            if (user == null || user.State != "A")
            {
                message = "AUTH.USER_NOT_FOUND";
                return null;
            }
            return user;
        }

        public object GenerateAccessToken(short code, string company, object user, ref string message)
        {
            try
            {
                var info = (UserTO)user;
                var tokenHandler = new JwtSecurityTokenHandler();
                var claimsIdentity = new ClaimsIdentity(new[] {
                    new Claim("CompanyCode", code.ToString()),
                    new Claim("Company", company),
                    new Claim("Code", info.Key.ToString()),
                    new Claim("Name", info.Name),
                });

                var signingCredentials = new SigningCredentials(new SymmetricSecurityKey(Convert.FromBase64String(configuration["JWT:Secret"])), SecurityAlgorithms.HmacSha256Signature);
                var tokenDescriptor = new SecurityTokenDescriptor
                {
                    Subject = claimsIdentity,
                    Issuer = configuration["JWT:Issuer"],
                    Audience = configuration["JWT:Audience"],
                    Expires = DateTime.Now.AddHours(8),
                    SigningCredentials = signingCredentials,

                };

                return new
                {
                    token = tokenHandler.WriteToken(tokenHandler.CreateToken(tokenDescriptor)),
                    user = new 
                    {
                        Key = info.Key,
                        Name = info.Name,
                        Email = info.Email
                    }
                };
            }
            catch (Exception)
            {

                message = "";
                return null;
            }
        }

        public AppUserTO GetUserInfo(string token)
        {
            return UserInfo(token);
        }

        private AppUserTO GetAppUserByEmail(string email)
        {
            return mapper.Map<AppUserTO>(
                ((DbSet<AppUser>)context.GetContext()).Where(x => x.Email == email).FirstOrDefault()
            );
        }

        private UserTO GetUserByLogin(string company, string email, string password)
        {
            unitOfWork.InitializeAuth(company);
            return mapper.Map<UserTO>(
                unitOfWork.Repositories.Use<User>().Find(x => x.Email == email && x.Password == password).FirstOrDefault()
            );
        }

        public static AppUserTO UserInfo(string token)
        {
            token = token.Substring("Bearer ".Length);
            var handler = new JwtSecurityTokenHandler();
            var jwt = handler.ReadJwtToken(token);
            var codeCompany = jwt.Claims.First(x => x.Type == "CompanyCode").Value;
            var company = jwt.Claims.First(x => x.Type == "Company").Value;
            var code = jwt.Claims.First(x => x.Type == "Code").Value;
            var name = jwt.Claims.First(x => x.Type == "Name").Value;
            return new AppUserTO() { 
                                        CompanyCode = short.Parse(codeCompany), 
                                        Company = company, 
                                        Key = short.Parse(code), 
                                        Name = name 
                                    };
        }
    }
}
