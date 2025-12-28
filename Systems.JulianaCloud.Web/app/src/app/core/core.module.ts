import { NgModule, Optional, SkipSelf } from '@angular/core';
import { CommonModule } from '@angular/common';
import { BaseUrlFactory } from './services/base-url-factory';
import { FilterPipe } from './pipes/filter/filter.pipe';



@NgModule({
  declarations: [
    FilterPipe
  ],
  providers: [
    BaseUrlFactory
  ],
  imports: [
    CommonModule
  ]
})
export class CoreModule { 

  constructor(@Optional() @SkipSelf() parentModule: CoreModule) {
    if (parentModule) {
      throw new Error(
        'CoreModule is already loaded. Import it in the AppModule only'
      );
    }
  }

}
