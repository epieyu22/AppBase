import { HttpClient } from '@angular/common/http';
import { Injectable } from '@angular/core';
import { BaseUrlFactory } from '@app/services/base-url-factory';
import apiEndpointsConstants from '@shared/resources/api-endpoints.constants';
import { BasicCrudService } from '@shared/services/crud/basic-crud.service';
import { environment } from 'environments/environment';

@Injectable({
  providedIn: 'root'
})
export class AuthService  extends BasicCrudService {

  key: string;
  user: any;
  constructor(protected baseUrlFactory: BaseUrlFactory,  protected http: HttpClient) { 
    super(baseUrlFactory, http);    
    this.key = environment.key;
    this.setEndpoint(apiEndpointsConstants.GENERALS.AUTH);
  }

  /* REQUEST FUNCTIONS */
  login(credentials: any) 
  {
    return this.http.post<any>(this.endpoint + '/login', credentials);
  }

  async info()
  {
    try
    {
      const response = await this.http.post<any>(this.endpoint + '/info', undefined).toPromise();
      this.user = response;
    }
    catch(error)
    {}
  }

  logout()
  {
    this.removeToken();
    window.location.reload();
  }

  load()
  {
    return new Promise<void>(async (resolve) => {
      await this.info();
      resolve();
    });
  }

  /*TOKEN FUNCTIONS */
  getToken()
  {
    return sessionStorage.getItem(`${this.key}`);
  }

  setToken(value: any)
  {
    sessionStorage.setItem(`${this.key}`, value);
  }

  containsToken()
  {
    return !!sessionStorage.getItem(`${this.key}`);
  }

  removeToken()
  {
    sessionStorage.removeItem(`${this.key}`);
  }
}
