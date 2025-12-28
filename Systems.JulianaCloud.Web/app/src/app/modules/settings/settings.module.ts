import { ModuleWithProviders, NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';

import { SettingsRoutingModule } from './settings-routing.module';
import { SharedModule } from '@shared/shared.module';
import { DxDataGridModule, DxBulletModule, DxTemplateModule } from 'devextreme-angular';
import { PositionsManagerComponent } from './pages/positions-manager/positions-manager.component';
import { WithdrawalManagerComponent } from './pages/withdrawal-manager/withdrawal-manager.component';

import translationConfig  from "@app/translation-config";
import { TranslateModule } from '@ngx-translate/core';
import { PositionsFormComponent } from './components/positions-form/positions-form.component';
import { EmployeePositionService } from './services/employee-position.service';
import { WithdrawalService } from './services/withdrawal.service';
import { WithdrawalsFormComponent } from './components/withdrawals/withdrawals-form/withdrawals-form.component';

@NgModule({
  declarations: [PositionsManagerComponent, PositionsFormComponent, WithdrawalManagerComponent, WithdrawalsFormComponent],
  providers: [
    EmployeePositionService,
    WithdrawalService
  ],
  imports: [
    CommonModule,
    SharedModule,
    SettingsRoutingModule,
    DxDataGridModule,
    DxBulletModule,
    DxTemplateModule
  ]
})
export class SettingsModule { }
