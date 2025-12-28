import { AfterViewInit, Component, EventEmitter, Input, Output } from "@angular/core";
import { AsyncValidatorFn, FormBuilder, FormControl, FormGroup, Validators } from '@angular/forms';
import notify from 'devextreme/ui/notify'
import { NgxSpinnerService } from "ngx-spinner";
import { TranslateService } from "@ngx-translate/core";
import { Observable } from "rxjs/internal/Observable";
import Conditions from "@shared/resources/conditions.constants"
import FormControlGenerator from "@shared/services/forms/formcontrol-generator.service";
import { map } from "rxjs/operators";

import { ArlService } from "@modules/generals/services/arl.service";
import { UpperCasePipe } from "@angular/common";

@Component({
    selector: 'arl-form',
    templateUrl: './arl-form.component.html',
  })

  export class ArlFormComponent implements AfterViewInit {    
    @Input()
    model: any
    models$: Observable<any[]>;
    form: FormGroup
    lastCode: number
    isNew: boolean
    translations: any = {}
    defaultValues = {key: 0, name: '', numDoc: null, dVer: '',address: '',tel1: '',tel2: '',contac: '',fax: '',total: 0,codSuper: ''}

    @Output()
    formSubmitted: EventEmitter<boolean> = new EventEmitter<boolean>()
    
    constructor(
      public arlService: ArlService,
      public formControlsGenerator: FormControlGenerator,
      private translateService: TranslateService,
      private spinner: NgxSpinnerService,
      private upperCasePipe: UpperCasePipe
    ) {
      
      this.initData();
      this.loadTranslations();
      this.form = new FormGroup(
        this.formControlsGenerator.generate(this.defaultValues, {
          "name": {
            validators: [Validators.required],
            asyncValidators: [this.checkDuplicatedName("Name")],
            updateOn: 'blur'
          },
          "numDoc": {
            validators: [Validators.required],
            updateOn: 'blur'
          },
          "dVer": {
            validators: [Validators.required],
            updateOn: 'blur'
          },
          "codSuper": {
            validators: [Validators.required],
            updateOn: 'blur'
          }
        })
      );
      
      this.form.valueChanges.subscribe((values) => {
        this.model = values;
      });
    }
    
    ngAfterViewInit(): void { }

    initData(isNew: boolean = false) {

      this.models$ = this.arlService.getAll();

      this.models$.subscribe(data => {
        this.lastCode = (Math.max.apply(null, data.map(c => c.key)) || 0 ) + 1;
        this.isNew = isNew;

        if(isNew) {
          this.form.reset();
          this.form.setValue(this.defaultValues);
          this.form.patchValue({ 'key': this.lastCode});  
        }
      })
    }

    ngOnChanges(changes: any) {
      this.form.patchValue(changes.model.currentValue || {});
    }

    fieldRequired( campo: string ) {
      return this.form.controls[campo].errors && this.form.controls[campo].touched;
    }
                  
    saveChanges() {

      if (this.form.invalid)
        return;

      this.spinner.show();
      
      //this.NumberPipe.arguments('numDoc')
      this.model.name = this.upperCasePipe.transform(this.model.name);
      this.model.numDoc = this.model.numDoc.toString();
      this.model.dVer = this.model.dVer.toString();
      this.model.tel1 = this.model.tel1.toString();
      this.model.tel2 = this.model.tel2.toString();
      this.model.fax = this.model.fax.toString();

      this.arlService[this.isNew ? 'create' : 'update'](this.model)
            .subscribe(
                response => {
                    notify(this.translations['MESSAGES.SAVED_CHANGES_SUCCESS'], 'success', 1000);
                },
                error => {
                    notify(this.translations['MESSAGES.SAVED_CHANGES_ERROR'], 'error', 1000);
                },
                () => {
                  this.spinner.hide();
                  this.formSubmitted.emit(true)
                }
            );        
    }

    checkDuplicatedName(name) : AsyncValidatorFn {
      return (control: FormControl) => {

        return this.arlService
                .getByProperty(name, control.value, Conditions.EQUAL)
                .pipe(
                  map((data : any[]) => {
                    return data.length ? {invalid: true} : null
                  })
                )
      };
    }

    loadTranslations(){
      let self = this;
      this.translateService.get([
        "MESSAGES.SAVED_CHANGES_SUCCESS",
        "MESSAGES.SAVED_CHANGES_ERROR",
      ])
      .subscribe(translations => self.translations = translations);
    }
  }

