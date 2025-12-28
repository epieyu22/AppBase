import { BrowserAnimationsModule } from "@angular/platform-browser/animations";
import { APP_INITIALIZER, NgModule } from "@angular/core";
import { FormsModule } from "@angular/forms";
import { HttpClient, HttpClientModule, HTTP_INTERCEPTORS } from "@angular/common/http";
import { RouterModule } from "@angular/router";
import { BsDropdownModule, TabsModule } from "ngx-bootstrap";
import { ToastrModule } from "ngx-toastr";
import { TagInputModule } from "ngx-chips";
import { CollapseModule } from 'ngx-bootstrap/collapse';

import { AppComponent } from "./app.component";

import { AppRoutingModule } from "./app-routing.module";

import { DxDataGridModule } from 'devextreme-angular';

import { CoreModule } from "@app/core.module";

import { LayoutsModule } from "./layouts/layouts.module";
import { AdminLayoutComponent } from "./layouts/admin/admin-layout.component";
import { AuthLayoutComponent } from "./layouts/auth/auth-layout.component";
import { SharedModule } from "@shared/shared.module";

import  translationConfig  from "@app/translation-config";
import { environment } from "environments/environment";
import { TranslateService } from "@ngx-translate/core";

import initMockServer from './mock/server.mock';
import { AuthModule } from "@modules/auth/auth.module";
import { InterceptorService } from "@shared/services/interceptors/interceptor.service";
import { AuthService } from "@modules/auth/services/auth.service";

if (process.env.NODE_ENV === "development") {
  console.log("Mock server enable")
  //initMockServer({environment: "development"});
}

@NgModule({
  imports: [
    BrowserAnimationsModule,
    FormsModule,
    HttpClientModule,
    translationConfig.forRoot,
    CoreModule,
    SharedModule,
    LayoutsModule,
    RouterModule,
    AuthModule,
    BsDropdownModule.forRoot(),
    AppRoutingModule,
    // Technical debt - se debe hacer un modulo que importe los sub modulos de Ngx-Bootstrap
    ToastrModule.forRoot(),
    CollapseModule.forRoot(),
    TabsModule.forRoot(),
    TagInputModule,
  ],
  declarations: [AppComponent, AdminLayoutComponent, AuthLayoutComponent],
  providers: [
    {
      provide: APP_INITIALIZER,
      useFactory: init,
      deps: [AuthService],
      multi: true
    }
  ],
  bootstrap: [AppComponent]
})
export class AppModule {}


export function init($app: AuthService) {
  return () => $app.load();
}