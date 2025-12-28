import { NgModule } from "@angular/core";
import { CommonModule } from "@angular/common";
import { ProgressbarModule } from "ngx-bootstrap/progressbar";

import { WidgetsComponent } from "./widgets.component";

import { RouterModule } from "@angular/router";
import { WidgetsRoutes } from "./widgets.routing";
import { LayoutsModule } from "@layouts/layouts.module";

@NgModule({
  declarations: [WidgetsComponent],
  imports: [
    CommonModule,
    RouterModule.forChild(WidgetsRoutes),
    ProgressbarModule.forRoot(),
    LayoutsModule
  ]
})
export class WidgetsModule {}
