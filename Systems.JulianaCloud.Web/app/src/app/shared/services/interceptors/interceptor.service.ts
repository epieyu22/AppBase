import { HttpErrorResponse, HttpEvent, HttpHandler, HttpHeaders, HttpInterceptor, HttpRequest } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { Router } from '@angular/router';
import { Observable, throwError } from 'rxjs';
import { catchError } from 'rxjs/operators';
import { AuthService } from '../../../modules/auth/services/auth.service';

@Injectable()
export class InterceptorService implements HttpInterceptor {

  translations: any = {};
  constructor(
    private router: Router,
    private auth$: AuthService
  ) { }
  intercept(req: HttpRequest<any>, next: HttpHandler): Observable<HttpEvent<any>> {
    
    if (this.auth$.containsToken())
    {
      req = req.clone({
          setHeaders: { Authorization: `Bearer ${this.auth$.getToken()}` }
      });
    }

    return next.handle(req)
    .pipe(
      catchError((error: HttpErrorResponse) => {
        if (error.status == 401)
        {
          if (this.auth$.containsToken()) 
          {
            this.auth$.removeToken();
          }
          this.router.navigateByUrl('/auth');
        }
        return throwError(error);
      })
    );
  }
}
