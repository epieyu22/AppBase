import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";
import { BaseUrlFactory } from "@app/services/base-url-factory";
import apiEndpointsConstants from "@shared/resources/api-endpoints.constants";
import { BasicCrudService } from "@shared/services/crud/basic-crud.service";
import { formatString } from "@shared/services/utils/string-formatter.service";

@Injectable()
export class CityService extends BasicCrudService {
    constructor(protected baseUrlFactory: BaseUrlFactory,  protected http: HttpClient) { 
        super(baseUrlFactory, http);    
        this.setEndpoint(apiEndpointsConstants.GENERALS.CITIES.DEFAULT);
    }

    getByDepartment(departmentCode) {
        let route = formatString(apiEndpointsConstants.GENERALS.CITIES.GET_BY_DEPARTMENT, departmentCode);
        return this.http.get<any>(`${this.endpoint}/${route}`);
    }
}