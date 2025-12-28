import { Injectable } from '@angular/core';
import { CanActivate, ActivatedRouteSnapshot, RouterStateSnapshot, Router } from '@angular/router';
import { Observable } from 'rxjs';
import { AuthService } from '../services/auth.service';

@Injectable({
  providedIn: 'root'
})
export class AuthenticatedGuard implements CanActivate {
  constructor(
    private auth$: AuthService,
    private router: Router
  ) 
  {}

  canActivate(
    next: ActivatedRouteSnapshot,
    state: RouterStateSnapshot): Promise<boolean> {
      return new Promise<boolean>(resolve => {
        setTimeout(() => {

          resolve(true);
          return

          if(!this.auth$.containsToken())
          {
            this.router.navigateByUrl('/auth');
            resolve(false);
          }
          else
            resolve(true);
        }, 1000);
      });
  }
  
}
