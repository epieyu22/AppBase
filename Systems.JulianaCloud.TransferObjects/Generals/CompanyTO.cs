using System;
using Systems.JulianaCloud.Domain.Interfaces;
using Systems.JulianaCloud.TransferObjects.Generals;

namespace Systems.JulianaCloud.TransferObjects
{
    public class CompanyTO : IKeyEntity<short>
    {
        #region Properties

        public short Key { get; set; }
        public string TypeDoc { get; set; }
        public string NumDoc { get; set; }
        public string VerificationDigit { get; set; }
        public string Name   { get; set; }
        public string Address { get; set; }
        
        public short CodeDepto { get; set; }
        public DepartmentTO Department { get; set; }

        public short CodeCity { get; set; }
        public CityTO City { get; set; }
        
        public string Tel { get; set; }
        public string Fax { get; set; }

        public short CodeRisk { get; set; }
        public RiskTO Risk { get; set; }
        
        public short CodeBranchOfficePag { get; set; }
        public BranchOfficeTO BranchOffice { get; set; }

        public string ClassContrib { get; set; }
        public string FormPresents { get; set; }
        public DateTime? FecInstall { get; set; }
        public DateTime? FecUltAccess { get; set; }
        public short DaisValidity { get; set; }
        public DateTime? FecExpiredLic { get; set; }
        public string Password { get; set; }
        public string CodeHabilita { get; set; }
        
        public short CodeCountry { get; set; }
        public CountryTO Country { get; set; }

        public short NumLicences { get; set; }
        public string Server { get; set; }
        public string DataBase { get; set; }
        public string User { get; set; }
        public string Passw { get; set; }
        public string Route { get; set; }
        public bool ModNom { get; set; }
        public bool ModRh { get; set; }
        public bool ModMis { get; set; }
        public string Serial { get; set; }
        public string CodeLocal { get; set; }
        public string Status { get; set; }
        
        #endregion
    }
}
