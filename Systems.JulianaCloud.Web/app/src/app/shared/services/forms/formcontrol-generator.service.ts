import { AsyncValidator, AsyncValidatorFn, FormControl, ValidatorFn } from "@angular/forms";

export default class FormControlGenerator {
    generate(
        model: any, 
        config: any){

        let schema = Object.keys(model)
                   .reduce((prev, key) => ({...prev, [key]: new FormControl(
                       model[key], 
                       config[key] 
                    )}), {});

        return schema;
    }
}