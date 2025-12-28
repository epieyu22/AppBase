import { DOCUMENT } from "@angular/common";
import { HttpClient } from "@angular/common/http";
import { Inject, Injectable } from "@angular/core";

const BASE_TAG = 'base';

@Injectable()
export class BaseUrlFactory {

    constructor(@Inject(DOCUMENT) private document: HTMLDocument) { }

    get() {
        return document.getElementsByTagName(BASE_TAG)[0].href; 
    } 
}