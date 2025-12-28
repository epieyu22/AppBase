import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';

import { ZoneManagerComponent } from './pages/zone-manager/zone-manager.component';
import { CountryManagerComponent } from './pages/country-manager/country-manager.component';
import { ProfessionManagerComponent } from './pages/profession-manager/profession-manager.component';
import { CompanyManagerComponent } from './pages/company-manager/company-manager.component';
import { EpsManagerComponent } from './pages/eps-manager/eps-manager.component';
import { DepartmentManagerComponent } from './pages/department-manager/department-manager.component'
import { ArlManagerComponent } from './pages/arl-manager/arl-manager.component';
import { CityManagerComponent } from './pages/city-mager/city-manager.component';
import { SubsidiaryManagerComponent } from './pages/subsidiary-manager/subsidiary-manager.component';
import { CajaManagerComponent } from './pages/caja-manager/caja-manager.component';
import { CostCenterManagerComponent } from './pages/costcenter-manager/costcenter-manager.component';
import { HolidayManagerComponent } from './pages/holiday-manager/holiday-manager.component';

const routes: Routes = [
  { 
    path: '', 
    children: [
      {
        path: 'zones',
        component: ZoneManagerComponent 
      },

      {
        path: 'countries',
        component: CountryManagerComponent
      },

      {
        path: 'professions',
        component: ProfessionManagerComponent
      },

      {
        path: 'companies',
        component: CompanyManagerComponent
      },

      {
        path: 'eps',
        component: EpsManagerComponent
      },

      {
        path: 'departments',
        component: DepartmentManagerComponent
      },

      {
        path: 'arl',
        component: ArlManagerComponent
      },

      {
        path: 'cities',
        component: CityManagerComponent
      },

      {
        path: 'subsidiaries',
        component: SubsidiaryManagerComponent
      },

      {
        path: 'cajas',
        component: CajaManagerComponent
      },

      {
        path: 'costcenters',
        component: CostCenterManagerComponent
      },

      {
        path: 'holidays',
        component: HolidayManagerComponent
      }
    ] 
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class GeneralsRoutingModule { }
