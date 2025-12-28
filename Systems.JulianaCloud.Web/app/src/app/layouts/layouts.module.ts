import { NgModule } from "@angular/core";
import { CommonModule } from "@angular/common";
import { PerfectScrollbarModule } from 'ngx-perfect-scrollbar';
import { PERFECT_SCROLLBAR_CONFIG } from 'ngx-perfect-scrollbar';
import { PerfectScrollbarConfigInterface } from 'ngx-perfect-scrollbar';

const DEFAULT_PERFECT_SCROLLBAR_CONFIG: PerfectScrollbarConfigInterface = {
  suppressScrollX: true
};
import { SidebarComponent } from "./components/sidebar/sidebar.component";
import { NavbarComponent } from "./components/navbar/navbar.component";
import { FooterComponent } from "./components/footer/footer.component";
import { VectorMapComponent1 } from "./components/vector-map/vector-map.component";

import { RouterModule } from "@angular/router";
import { CollapseModule } from "ngx-bootstrap/collapse";
import { DxVectorMapModule } from "devextreme-angular";
import { BsDropdownModule } from "ngx-bootstrap";
import { NgxSpinnerModule } from "ngx-spinner";

@NgModule({
  imports: [
    CommonModule,
    RouterModule,
    CollapseModule.forRoot(),
    DxVectorMapModule,
    PerfectScrollbarModule,
    BsDropdownModule.forRoot(),
    NgxSpinnerModule
  ],
  declarations: [
    FooterComponent,
    VectorMapComponent1,
    NavbarComponent,
    SidebarComponent
  ],
  exports: [
    FooterComponent,
    VectorMapComponent1,
    NavbarComponent,
    SidebarComponent
  ],
  providers: [
    {
      provide: PERFECT_SCROLLBAR_CONFIG,
      useValue: DEFAULT_PERFECT_SCROLLBAR_CONFIG
    }
  ]
})
export class LayoutsModule {}
