import { NgModule } from '@angular/core';
import { CommonModule, UpperCasePipe } from '@angular/common';
import { DxBulletModule, DxDataGridModule, DxTemplateModule } from 'devextreme-angular';

import { GeneralsRoutingModule } from './generals-routing.module';
import { SharedModule } from '@shared/shared.module';

import { ZoneService } from './services/zone.service';
import { CountryService } from './services/country.service';
import { ProfessionService } from './services/profession.service';
import { CompanyService } from './services/company.service';
import { EpsService } from './services/eps.service';
import { DepartmentService } from './services/department.service';
import { ArlService } from './services/arl.service';
import { CityService } from './services/city.service';
import { CajaService } from './services/caja.service';
import { SubsidiaryService } from './services/subsidiary.service';
import { CostCenterService } from './services/costcenter.service';
import { HolidayService } from './services/holiday.service';

import { ZoneManagerComponent } from './pages/zone-manager/zone-manager.component';
import { CountryManagerComponent } from './pages/country-manager/country-manager.component';
import { ProfessionManagerComponent } from './pages/profession-manager/profession-manager.component';
import { CompanyManagerComponent } from './pages/company-manager/company-manager.component';
import { EpsManagerComponent } from './pages/eps-manager/eps-manager.component';
import { DepartmentManagerComponent } from './pages/department-manager/department-manager.component';
import { ArlManagerComponent } from './pages/arl-manager/arl-manager.component';
import { CityManagerComponent } from './pages/city-mager/city-manager.component';
import { SubsidiaryManagerComponent } from './pages/subsidiary-manager/subsidiary-manager.component';
import { CostCenterManagerComponent } from './pages/costcenter-manager/costcenter-manager.component';
import { HolidayManagerComponent } from './pages/holiday-manager/holiday-manager.component';

import { ZonesFormComponent } from './components/zones/zones-form/zones-form.component';
import { CountriesFormComponent } from './components/countries/countries-form/countries-form.component';
import { ProfessionsFormComponent } from './components/professions/professions-form/professions-form.component';
import { CompaniesFormComponent } from './components/companies/companies-form/companies-form.component';
import { EpsFormComponent } from './components/eps/eps-form/eps-form.component';
import { DepartmentsFormComponent } from './components/departments/departments-form.component';
import { ArlFormComponent } from './components/arl/arl-form/arl-form.component';
import { CitiesFormComponent } from './components/cities/cities-form/cities-form.component';
import { CajasFormComponent } from './components/cajas/cajas-form/cajas-form.component';
import { CajaManagerComponent } from './pages/caja-manager/caja-manager.component';
import { SubsidiariesFormComponent } from './components/subsidiaries/subsidiaries-form/subsidiaries-form.component';
import { CostCentersFormComponent } from './components/costcenters/costcenters-form/costcenters-form.component';
import { HolidaysFormComponent } from './components/holidays/holidays-form/holidays-form.component';
import { NumberPipe } from './pipes/number.pipe';


@NgModule({
  declarations: [
    ZoneManagerComponent,
    CountryManagerComponent,
    ProfessionManagerComponent,
    CompanyManagerComponent,
    EpsManagerComponent,
    DepartmentManagerComponent,
    ArlManagerComponent,
    CityManagerComponent,
    SubsidiaryManagerComponent,
    CajaManagerComponent,
    CostCenterManagerComponent,
    HolidayManagerComponent,
    ZonesFormComponent,
    CountriesFormComponent,
    ProfessionsFormComponent,
    CompaniesFormComponent,
    EpsFormComponent,
    DepartmentsFormComponent,
    ArlFormComponent,
    CitiesFormComponent,
    SubsidiariesFormComponent,
    CajasFormComponent,
    CostCentersFormComponent,
    HolidaysFormComponent
  ],

  providers: [
    CompanyService,
    ZoneService,
    CountryService,
    ProfessionService,
    EpsService,
    DepartmentService,
    ArlService,
    CityService,
    SubsidiaryService,
    CajaService,
    CostCenterService,
    HolidayService,
    UpperCasePipe,
    NumberPipe
  ],
  imports: [
    CommonModule,
    SharedModule,
    GeneralsRoutingModule,
    DxDataGridModule,
    DxBulletModule,
    DxTemplateModule
  ]
})
export class GeneralsModule { }
