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
        public string DVer { get; set; }
        public string Name   { get; set; }
        public string Address { get; set; }
        
        public short CodDep { get; set; }
        public DepartmentTO Department { get; set; }

        public short CodCity { get; set; }
        public CityTO City { get; set; }
        
        public string Tel { get; set; }
        public string Fax { get; set; }

        public short CodArl { get; set; }
        public ArlTO Arl { get; set; }
        
        public short CodSubsiPag { get; set; }
        public SubsidiaryTO Subsidiary { get; set; }

        public string ClassContrib { get; set; }
        public string FormPresents { get; set; }
        public DateTime? FecInstall { get; set; }
        public DateTime? FecUltAccess { get; set; }
        public short DaisValidity { get; set; }
        public DateTime? FecExpiredLic { get; set; }
        public string Clave { get; set; }
        public string CodHabilita { get; set; }
        
        public short CodCountry { get; set; }
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
        public string CodLocal { get; set; }
        public string State { get; set; }
        
        #endregion
    }
}
