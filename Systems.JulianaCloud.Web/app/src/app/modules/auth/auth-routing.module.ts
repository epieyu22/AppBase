import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { AuthLayoutComponent } from '@layouts/auth/auth-layout.component';
import { LoginComponent } from './pages/login/login.component';
import { RecoveryPasswordComponent } from './pages/recovery-password/recovery-password.component';


const routes: Routes = [
  {
    path: '',
    component: AuthLayoutComponent,
    children: [
      { path: '', component: LoginComponent },
      { path: 'password', component: RecoveryPasswordComponent }
    ]
  }
];

@NgModule({
  imports: [RouterModule.forChild(routes)],
  exports: [RouterModule]
})
export class AuthRoutingModule { }
