import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";
import CustomStore from "devextreme/data/custom_store";
import { BaseUrlFactory } from "@app/services/base-url-factory";
import apiEndpointsConstants from "@shared/resources/api-endpoints.constants";
import { BasicCrudService } from "@shared/services/crud/basic-crud.service";

@Injectable()
export class WithdrawalService extends BasicCrudService{
  debugger
    constructor(protected baseUrlFactory: BaseUrlFactory,  protected http: HttpClient) { 
        super(baseUrlFactory, http);    
        
      this.setEndpoint(apiEndpointsConstants.SETTINGS.WITHDRAWALS);
    }
}
