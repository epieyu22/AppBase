import { NgModule } from '@angular/core';
import { CommonModule } from '@angular/common';
import { RouterModule } from '@angular/router';
import { HttpClientModule, HTTP_INTERCEPTORS } from '@angular/common/http';
import { FormsModule, ReactiveFormsModule } from '@angular/forms';
import { DxDataGridModule, DxBulletModule, DxTemplateModule, DxFormModule, DxPopupModule, DxScrollViewModule, DxButtonModule } from 'devextreme-angular';
import { TabsModule } from 'ngx-bootstrap/tabs';
import { NgSelectModule } from '@ng-select/ng-select';
import { NgxSpinnerModule } from 'ngx-spinner';

import { CrudButtonsComponent } from './components/crud-buttons/crud-buttons.component';
import { componentsTypes } from './components';
import translationConfig from '@app/translation-config';
import { PdfExportButtonComponent } from './components/pdf-export-button/pdf-export-button.component';
import FormControlGenerator from './services/forms/formcontrol-generator.service';
import { InterceptorService } from './services/interceptors/interceptor.service';
import { ErrorSummaryComponent } from './components/error-summary/error-summary.component';

let modules = [
  CommonModule,
  RouterModule,
  HttpClientModule,
  ReactiveFormsModule,
  FormsModule,
  DxFormModule,
  DxDataGridModule,
  DxPopupModule,
  DxBulletModule,
  DxTemplateModule,
  DxScrollViewModule,
  DxButtonModule,
  NgSelectModule,
  NgxSpinnerModule,
  TabsModule
]

@NgModule({
  declarations: [CrudButtonsComponent, PdfExportButtonComponent, ErrorSummaryComponent],
  imports: [...modules, translationConfig.forShareImport],
  providers: [
    FormControlGenerator,
    {
      provide: HTTP_INTERCEPTORS,
      useClass: InterceptorService,
      multi: true
    },
  ],
  exports: [
    ...modules,
    ...componentsTypes,
    translationConfig.forShareExport,
  ],
})
export class SharedModule { }
