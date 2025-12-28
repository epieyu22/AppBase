using AutoMapper;
using System;
using Systems.JulianaCloud.Commons.Utils;
using Systems.JulianaCloud.Domain;
using Systems.JulianaCloud.Domain.Authentication;
using Systems.JulianaCloud.Domain.Employee;
using Systems.JulianaCloud.Domain.Generals;
using Systems.JulianaCloud.Domain.Novelty;
using Systems.JulianaCloud.Resources;
using Systems.JulianaCloud.Resources;
using Systems.JulianaCloud.TransferObjects;
using Systems.JulianaCloud.TransferObjects.Authentication;
using Systems.JulianaCloud.TransferObjects.Employee;
using Systems.JulianaCloud.TransferObjects.Generals;
using Systems.JulianaCloud.TransferObjects.Novelties;

namespace Systems.JulianaCloud.Bootstraper
{
    public class MappingProfile : Profile
    {
        public MappingProfile()
        {
            #region Employee

            this.CreateMap<PositionTO, Position>();
            this.CreateMap<Position, PositionTO>()
                .ForMember(x => x.HasBoss, opt => opt.MapFrom(x => x.HasBoss.HasValue ? x.HasBoss.Value : x.HasBossOld == "S"))
                .ForMember(x => x.AuthorizeSalaries, opt => opt.MapFrom(x => x.AuthorizeSalaries.HasValue ? x.AuthorizeSalaries.Value : x.AuthorizeSalariesOld == "S"))
                .ForMember(x => x.ReceiveMails, opt => opt.MapFrom(x => x.ReceiveMails.HasValue ? x.ReceiveMails.Value : x.ReceiveMailsOld == "S"))
                .ForMember(x => x.Art209, opt => opt.MapFrom(x => x.Art209.HasValue ? x.Art209.Value : x.Art209Old == "S"));

            this.CreateMap<WithdrawalTO, Withdrawal>();
            this.CreateMap<Withdrawal, WithdrawalTO>();
            this.CreateMap<Employee, EmployeeTO>()
                .ForMember(x => x.Code, opt => opt.MapFrom(x => x.Cod_Empleado))
                .ForMember(x => x.IdentificationNumber, opt => opt.MapFrom(x => x.Cedula))
                .ForMember(x => x.Name, opt => opt.MapFrom(x => x.Empleado));

            #endregion

            #region Generals

            this.CreateMap<ZoneTO, Zone>();
            this.CreateMap<Zone, ZoneTO>();

            this.CreateMap<CountryTO, Country>();
            this.CreateMap<Country, CountryTO>();

            this.CreateMap<ProfessionTO, Profession>();
            this.CreateMap<Profession, ProfessionTO>();

            this.CreateMap<CompanyTO, Company>();
            this.CreateMap<Company, CompanyTO>()
                .ForMember(x => x.ModNom, opt => opt.MapFrom(x => x.ModNOM.HasValue ? x.ModNOM.Value : x.ModNOMOld == "S"))
                .ForMember(x => x.ModRh, opt => opt.MapFrom(x => x.ModRH.HasValue ? x.ModRH.Value : x.ModRHOld == "S"))
                .ForMember(x => x.ModMis, opt => opt.MapFrom(x => x.ModMIS.HasValue ? x.ModMIS.Value : x.ModMISOld == "S"));
                //.ForMember(x => x.FecInstall, opt => opt.MapFrom(x => x.FecInstall.HasValue ? x.FecInstall.Value : DateHelper.ConvertUglyDate(x.FecInstallOld))) 
                //.ForMember(x => x.FecUltAccess, opt => opt.MapFrom(x => x.FecUltAccess.HasValue ? x.FecUltAccess.Value : DateHelper.ConvertUglyDate(x.FecUltAccessOld)))
                //.ForMember(x => x.FecExpiredLic, opt => opt.MapFrom(x => x.FecExpiredLic.HasValue ? x.FecExpiredLic.Value : DateHelper.ConvertUglyDate(x.FecExpiredLicOld)));

            this.CreateMap<Health, HealthTO>();
            this.CreateMap<HealthTO, Health>();

            this.CreateMap<DepartmentTO, Department>();
            this.CreateMap<Department, DepartmentTO>();

            this.CreateMap<CityTO, City>();
            this.CreateMap<City, CityTO>();

            this.CreateMap<RiskTO, Risk>();
            this.CreateMap<Risk, RiskTO>();

            this.CreateMap<BranchOfficeTO, BranchOffice>();
            this.CreateMap<BranchOffice, BranchOfficeTO>()
                .ForMember(x => x.ComMeta, opt => opt.MapFrom(x => x.ComMeta.HasValue ? x.ComMeta.Value : x.ComMetaOld == "S"))
                .ForMember(x => x.HasCompany, opt => opt.MapFrom(x => x.HasCompany.HasValue ? x.HasCompany.Value : x.HasCompanyOld == "S"));

            this.CreateMap<BoxFamilierTO, BoxFamilier>();
            this.CreateMap<BoxFamilier, BoxFamilierTO>();

            this.CreateMap<CostCenterTO, CostCenter>();
            this.CreateMap<CostCenter, CostCenterTO>()
                .ForMember(x => x.BranchOffice, opt => opt.MapFrom(x => x.HasBranchOffice.HasValue ? x.HasBranchOffice.Value : x.BranchOfficeOld == "S"));

            this.CreateMap<HolidayTO, Holiday>();
            this.CreateMap<Holiday, HolidayTO>()
            .ForMember(x => x.HolidayDate, opt => opt.MapFrom(x => x.HolidaytDate.HasValue ? x.HolidaytDate.Value : DateHelper.ConvertUglyDate(x.HolidaytDateOld, ValueConstants.DefaultDateStringFormat)));

            this.CreateMap<UserTO, User>();
            this.CreateMap<User, UserTO>();

            this.CreateMap<AppUserTO, AppUser>();
            this.CreateMap<AppUser, AppUserTO>();

            this.CreateMap<UtilityTO, Utility>();
            this.CreateMap<Utility, UtilityTO>();


            #endregion

            #region Novelties

            this.CreateMap<NoveltyHistoric, NoveltyHistoricTO>();
            this.CreateMap<Employee, NoveltyEmployeeTO>()
                .ForMember(x => x.Code, opt => opt.MapFrom(x => x.Cod_Empleado))
                .ForMember(x => x.IdentificationNumber, opt => opt.MapFrom(x => x.Cedula))
                .ForMember(x => x.Name, opt => opt.MapFrom(x => x.Empleado));

            this.CreateMap<Concept, NoveltyConceptTO>()
                .ForMember(x => x.Code, opt => opt.MapFrom(x => x.Cod_Concepto))
                .ForMember(x => x.IsAccrual, opt => opt.MapFrom(x => x.Devengo == ValueConstants.TrueStringValue))
                .ForMember(x => x.Name, opt => opt.MapFrom(x => x.Nom_Concepto));

            #endregion
        }
    }
}
