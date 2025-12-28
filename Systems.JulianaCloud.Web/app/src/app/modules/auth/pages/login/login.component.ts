import { Component, OnInit } from '@angular/core';
import { FormBuilder, FormGroup } from '@angular/forms';
import { AuthService } from '@modules/auth/services/auth.service';
import { TranslateService } from '@ngx-translate/core';
import { NgxSpinnerService } from 'ngx-spinner';
import notify from 'devextreme/ui/notify';
import { Router } from '@angular/router';

@Component({
  selector: 'app-login',
  templateUrl: './login.component.html',
  styleUrls: ['./login.component.scss']
})
export class LoginComponent implements OnInit {

  focus;
  focus1;
  translations: any = {};
  form: FormGroup;
  constructor(
    private formBuilder: FormBuilder,
    private auth$: AuthService,
    private translateService: TranslateService,
    private spinner: NgxSpinnerService,
    private router: Router
  ) { }

  ngOnInit() {
    this.loadTranslations();
    console.log(this.translations)
    this.form = this.formBuilder.group({
      email: 'alicia@gmail.com',
      password: '11111111111111111111'
    });
  }

  async onSubmit()
  {
    this.spinner.show();
    try 
    {
      const response: any = await this.auth$.login(this.form.value).toPromise();
      this.auth$.setToken(response.token);
      this.router.navigateByUrl('/generals/zones');
      notify(this.translations['AUTH.WELCOME'], 'success', 1000);
    } 
    catch (error) 
    {
      console.log(error.error?.message)
      if(error.error?.message)
        notify(this.translations[error.error?.message], 'error', 1000);
    }
    finally
    {
      this.spinner.hide();
    }
  }

  loadTranslations(){
    let self = this;
    this.translateService.get([
      'MESSAGES.SERVER_ERROR',
      'AUTH.INVALID_DATA',
      'AUTH.WELCOME',
      'AUTH.USER_NOT_FOUND',
      'FORGOT_PASSWORD',
      'MESSAGES.SAVED_CHANGES_SUCCESS'
    ])
    .subscribe(translations => {
      self.translations = translations
      console.log(translations)
    });
  }
}
