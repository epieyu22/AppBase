import { HttpClient } from '@angular/common/http';
import {TranslateLoader, TranslateModule} from '@ngx-translate/core';
import {TranslateHttpLoader} from '@ngx-translate/http-loader';
import { environment } from 'environments/environment';


// required for AOT compilation
function HttpLoaderFactory(http: HttpClient) {
    return new TranslateHttpLoader(http, './assets/i18n/', '.json');
}

export default {    
    "forRoot": TranslateModule.forRoot({
      loader:{
        provide: TranslateLoader,
        useFactory: HttpLoaderFactory,
        deps: [HttpClient]
      },
      defaultLanguage: environment.defaultLanguage
    }),
    "forShareImport": TranslateModule.forChild(),
    "forShareExport": TranslateModule,
    "factory": HttpLoaderFactory
  }
