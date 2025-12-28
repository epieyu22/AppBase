import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { BaseUrlFactory } from "@app/services/base-url-factory";
import apiEndpointsConstants from "@shared/resources/api-endpoints.constants";
import { BasicCrudService } from "@shared/services/crud/basic-crud.service";

@Injectable()
export class EpsService extends BasicCrudService {
    constructor(protected baseUrlFactory: BaseUrlFactory,  protected http: HttpClient) { 
        super(baseUrlFactory, http);    
        this.setEndpoint(apiEndpointsConstants.GENERALS.EPS);
    }
}
