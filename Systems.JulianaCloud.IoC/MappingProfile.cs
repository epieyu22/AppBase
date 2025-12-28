using AutoMapper;
using System;
using Systems.JulianaCloud.Commons.Utils;
using Systems.JulianaCloud.Domain;
using Systems.JulianaCloud.Domain.Authentication;
using Systems.JulianaCloud.Domain.Employee;
using Systems.JulianaCloud.Domain.Generals;
using Systems.JulianaCloud.TransferObjects;
using Systems.JulianaCloud.TransferObjects.Authentication;
using Systems.JulianaCloud.TransferObjects.Employee;
using Systems.JulianaCloud.TransferObjects.Generals;

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
                .ForMember(x => x.ModMis, opt => opt.MapFrom(x => x.ModMIS.HasValue ? x.ModMIS.Value : x.ModMISOld == "S"))
                .ForMember(x => x.FecInstall, opt => opt.MapFrom(x => x.FecInstall.HasValue ? x.FecInstall.Value : DateHelper.ConvertUglyDate(x.FecInstallOld)))
                .ForMember(x => x.FecUltAccess, opt => opt.MapFrom(x => x.FecUltAccess.HasValue ? x.FecUltAccess.Value : DateHelper.ConvertUglyDate(x.FecUltAccessOld)))
                .ForMember(x => x.FecExpiredLic, opt => opt.MapFrom(x => x.FecExpiredLic.HasValue ? x.FecExpiredLic.Value : DateHelper.ConvertUglyDate(x.FecExpiredLicOld)));

            this.CreateMap<Eps, EpsTO>();
            this.CreateMap<EpsTO, Eps>();

            this.CreateMap<DepartmentTO, Department>();
            this.CreateMap<Department, DepartmentTO>();

            this.CreateMap<CityTO, City>();
            this.CreateMap<City, CityTO>();

            this.CreateMap<ArlTO, Arl>();
            this.CreateMap<Arl, ArlTO>();

            this.CreateMap<SubsidiaryTO, Subsidiary>();
            this.CreateMap<Subsidiary, SubsidiaryTO>()
                .ForMember(x => x.CumMeta, opt => opt.MapFrom(x => x.CumMeta.HasValue ? x.CumMeta.Value : x.CumMetaOld == "S"))
                .ForMember(x => x.HasCompany, opt => opt.MapFrom(x => x.HasCompany.HasValue ? x.HasCompany.Value : x.HasCompanyOld == "S"));

            this.CreateMap<CajaTO, Caja>();
            this.CreateMap<Caja, CajaTO>();

            this.CreateMap<CostCenterTO, CostCenter>();
            this.CreateMap<CostCenter, CostCenterTO>();

            this.CreateMap<HolidayTO, Holiday>();
            this.CreateMap<Holiday, HolidayTO>()
            .ForMember(x => x.HolidayDate, opt => opt.MapFrom(x => x.HolidaytDate.HasValue ? x.HolidaytDate.Value : DateHelper.ConvertUglyDate(x.HolidaytDateOld)));

            this.CreateMap<UserTO, User>();
            this.CreateMap<User, UserTO>();

            this.CreateMap<AppUserTO, AppUser>();
            this.CreateMap<AppUser, AppUserTO>();

            this.CreateMap<WithdrawalTO, Withdrawal>();
            this.CreateMap<Withdrawal, WithdrawalTO>();
            #endregion
        }
    }
}
