import { AfterViewInit, Component, EventEmitter, Input, Output } from "@angular/core";
import { AsyncValidatorFn, FormControl, FormGroup, Validators } from "@angular/forms";
import notify from 'devextreme/ui/notify'
import { NgxSpinnerService } from "ngx-spinner";
import { TranslateService } from "@ngx-translate/core";
import { Observable } from "rxjs/internal/Observable";
import { map } from "rxjs/operators";

import FormControlGenerator from "@shared/services/forms/formcontrol-generator.service";
import Conditions from "@shared/resources/conditions.constants"
import { CajaService } from "@modules/generals/services/caja.service";
import { Caja, CajaTemplate } from "@data/types/generals/caja";
import { Subsidiary }  from "@data/types/generals/subsidiary"; 
import { SubsidiaryService } from "@modules/generals/services/subsidiary.service";
import { Zone, ZoneTemplate } from "@data/types/generals/dependence";
import { ZoneService } from "@modules/generals/services/zone.service";


@Component({
    selector: 'subsidiaries-form',
    templateUrl: './subsidiaries-form.component.html',
  })
  export class SubsidiariesFormComponent implements AfterViewInit {

    @Input()
    model: any
    models$: Observable<any[]>;
    zones$: Observable<Zone>
    cajas$: Observable<Caja>
    form: FormGroup
    lastCode: number
    isNew: boolean
    translations: any = {}
    defaultValues = {key: 0, codZone: 0, name: '',cumMeta: false, codCaja: 0, codSubsiSec: '', hasCompany: false,
    numDoc: '',dVer: '', unified: '',codAgency: 0}

    @Output()
    formSubmitted: EventEmitter<boolean> = new EventEmitter<boolean>()

    constructor(
      public subsidiaryService: SubsidiaryService,
      public zoneService: ZoneService,
      public cajaService: CajaService,
      private translateService: TranslateService,
      public formControlsGenerator: FormControlGenerator,
      private spinner: NgxSpinnerService
    ) {
      
      this.initData();
      this.loadTranslations();
      this.form = new FormGroup(
        this.generateControls(this.defaultValues)
      );

      this.formControlsGenerator.generate(ZoneTemplate,
        {
            "name": {
              validators: [Validators.required],
              asyncValidators: [this.checkDuplicatedName("Name")],
              updateOn: 'blur'
            }
         });
  
         this.formControlsGenerator.generate(CajaTemplate,
          {
              "name": {
                validators: [Validators.required],
                asyncValidators: [this.checkDuplicatedName("Name")],
                updateOn: 'blur'
              }
           });

          this.form.valueChanges.subscribe((values) => {
          this.model = values;
      });
    }

    ngAfterViewInit(): void { }

    generateControls(model: Subsidiary) {
      let schema = Object.keys(model)
                   .reduce((prev, key) => ({...prev, [key]: new FormControl(model[key]), }), {});
      return schema;
    }

    initData(isNew: boolean = false) {
      this.models$ = this.subsidiaryService.getAll();
      this.models$.subscribe(data => {
        this.lastCode = (Math.max.apply(null, data.map(c => c.key)) || 0 ) + 1;

        this.isNew = isNew;

        if(isNew) {
          this.form.reset();
          this.form.setValue(this.defaultValues);
          this.form.patchValue({ 'key': this.lastCode});  
        }
      })

      this.zones$ = this.zoneService.getAll();
      this.zones$.subscribe(data => {
        console.log(data)
      });

      this.cajas$ = this.cajaService.getAll();
      this.cajas$.subscribe(data => {
        console.log(data)
      });
    }
    
    ngOnChanges(changes: any) {
      this.form.patchValue(changes.model.currentValue);
    }

  saveChanges() {
      this.spinner.show();

      this.subsidiaryService[this.isNew ? 'create' : 'update'](this.model)
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

    checkDuplicatedName(name: string) : AsyncValidatorFn {
      return (control: FormControl) => {
        return this.subsidiaryService
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