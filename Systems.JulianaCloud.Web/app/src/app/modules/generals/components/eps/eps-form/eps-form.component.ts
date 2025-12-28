import { AfterViewInit, Component, EventEmitter, Input, Output } from "@angular/core";
import { FormControl, FormGroup } from "@angular/forms";
import notify from 'devextreme/ui/notify'
import { NgxSpinnerService } from "ngx-spinner";
import { TranslateService } from "@ngx-translate/core";
import { Observable } from "rxjs/internal/Observable";

import { EpsService } from "@modules/generals/services/eps.service";



@Component({
    selector: 'eps-form',
    templateUrl: './eps-form.component.html',
  })

  export class EpsFormComponent implements AfterViewInit {    
    @Input()
    model: any
    models$: Observable<any[]>;
    form: FormGroup
    lastCode: number
    isNew: boolean
    translations: any = {}
    defaultValues = {key: 0, name: '', numDoc: '',dVer: '',address: '',tel1: '',tel2: '',contac: '',fax: '',total: 0,codSuper: ''}

    @Output()
    formSubmitted: EventEmitter<boolean> = new EventEmitter<boolean>()

    constructor(
      public epsService: EpsService,
      private translateService: TranslateService,
      private spinner: NgxSpinnerService
    ) {
      
      this.initData();
      this.loadTranslations();
      this.form = new FormGroup(
        this.generateControls(this.defaultValues)
      );
      
      this.form.valueChanges.subscribe((values) => {
        this.model = values;
      });
    }

    ngAfterViewInit(): void { }

    generateControls(model) {
      let schema = Object.keys(model)
                   .reduce((prev, key) => ({...prev, [key]: new FormControl(model[key]), }), {});
      return schema;
    }

    initData(isNew: boolean = false) {
      this.models$ = this.epsService.getAll();

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
      this.form.patchValue(changes.model.currentValue);
    }

  saveChanges() {
      this.spinner.show();
      this.epsService[this.isNew ? 'create' : 'update'](this.model)
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

    loadTranslations(){
      let self = this;
      this.translateService.get([
        "MESSAGES.SAVED_CHANGES_SUCCESS",
        "MESSAGES.SAVED_CHANGES_ERROR",
      ])
      .subscribe(translations => self.translations = translations);
    }

  }
