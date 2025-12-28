import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AdminLayoutComponent } from '@layouts/admin/admin-layout.component';
import { PositionsManagerComponent } from './pages/positions-manager/positions-manager.component';
import { WithdrawalManagerComponent } from './pages/withdrawal-manager/withdrawal-manager.component';
const routes: Routes = [
  { 
    path: '', 
    children: [
      {
        path: 'positions',
        component: PositionsManagerComponent 
      },
      {
        path: 'withdrawals',
        component: WithdrawalManagerComponent
      }
    ] 
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class SettingsRoutingModule { }
