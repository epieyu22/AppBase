import { NgModule } from '@angular/core';
import { Routes, RouterModule } from '@angular/router';
import { CommonModule } from '@angular/common';
import { BrowserModule } from '@angular/platform-browser';

import { AdminLayoutComponent } from '@layouts/admin/admin-layout.component';
import { AuthenticatedGuard } from '@modules/auth/guards/authenticated.guard';

const routes: Routes = [
  {
    path: '',
    component: AdminLayoutComponent,
   // canActivate: [AuthenticatedGuard],
    children: [
      { 
        path: 'settings', 
        loadChildren: () => import('./modules/settings/settings.module').then(m => m.SettingsModule) 
      },
      {
        path: 'generals',
        loadChildren: () => import('./modules/generals/generals.module').then(m => m.GeneralsModule) 
      }
    ]
  },
  {
    path: 'auth',
    loadChildren: () => import('./modules/auth/auth.module').then(m => m.AuthModule)
  },

  /*{
    path: '**',
    redirectTo: 'auth'
  },*/
  
];

@NgModule({
  imports: [
    CommonModule,
    BrowserModule,
    RouterModule.forRoot(routes, {
      useHash: true
    })
  ],
  exports: [RouterModule]
})
export class AppRoutingModule {}
