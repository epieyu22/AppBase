import { HttpClient } from "@angular/common/http";
import { Injectable } from "@angular/core";
import CustomStore from "devextreme/data/custom_store";
import { BaseUrlFactory } from "@app/services/base-url-factory";
import apiEndpointsConstants from "@shared/resources/api-endpoints.constants";
import { formatString } from "../utils/string-formatter.service";

@Injectable()
export class BasicCrudService {
    endpoint: string
    
    constructor(protected baseUrlFactory: BaseUrlFactory,  protected http: HttpClient) { 
    }

    setEndpoint(code){
        this.endpoint = this.baseUrlFactory.get() + `${apiEndpointsConstants.getFullEndpoint(code)}`;   
    }

    getStore(key: string = "key") {
        return new CustomStore({
            key: key,
            byKey: (key) => this.getByCode(key).toPromise(),
            insert: (values) => this.create(values).toPromise(),
            update: (key, values) => this.update({...values, code: key }).toPromise(),
            remove: (key) => this.delete(key).toPromise(),
            load: () => this.getAll().toPromise()
        });
    }

    getAll() {
        return this.http.get<any>(this.endpoint);
    }

    getByProperty(name, value, condition){
        let route = formatString(apiEndpointsConstants.GET_BY_PROPERTY_ROUTE, name, condition, value);
        return this.http.get(`${this.endpoint}/${route}`)
    }

    getByCode(code) {
        return this.http.get<any>(`${this.endpoint}/${code}`);
    }

    create(holiday) {
      return this.http.post<any>(this.endpoint, holiday);
    }

    update(holiday) {
      return this.http.put<any>(this.endpoint, { ...holiday, changedProperties: Object.keys(holiday) });
    }

    delete(key) {
        return this.http.delete<void>(`${this.endpoint}/${key}`);
    }
}
