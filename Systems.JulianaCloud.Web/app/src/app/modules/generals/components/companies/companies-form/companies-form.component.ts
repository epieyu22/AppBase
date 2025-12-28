import { AfterViewInit, Component, EventEmitter, Input, Output } from "@angular/core";
import { AsyncValidatorFn, FormControl, FormGroup, Validators } from "@angular/forms";
import notify from 'devextreme/ui/notify'
import { NgxSpinnerService } from "ngx-spinner";
import { TranslateService } from "@ngx-translate/core";
import { Observable } from "rxjs/internal/Observable";
import { map } from "rxjs/operators";

import FormControlGenerator from "@shared/services/forms/formcontrol-generator.service";
import Conditions from "@shared/resources/conditions.constants"
import { City, Country, Department } from "@data/types/generals/dependence";
import { CountryService } from "@modules/generals/services/country.service";
import { DepartmentService } from "@modules/generals/services/department.service";
import { ArlService } from '@modules/generals/services/arl.service';
import { CityService } from '@modules/generals/services/city.service';
import { SubsidiaryService } from '../../../services/subsidiary.service';
import { CompanyService } from "@modules/generals/services/company.service";
import { Arl } from "@data/types/generals/arl";
import { Subsidiary } from "@data/types/generals/subsidiary";

@Component({
    selector: 'companies-form',
    templateUrl: './companies-form.component.html',
  })

  export class CompaniesFormComponent implements AfterViewInit {
    @Input()
    model: any
    models$: Observable<any[]>;
    countries$: Observable<Country[]>;
    cities$: Observable<City[]>;
    arls$: Observable<Arl[]>;
    subsidiaries$: Observable<Subsidiary[]>;
    departaments$: Observable<Department[]>;
    form: FormGroup
    lastCode: number
    isNew: boolean
    translations: any = {}
    defaultValues = {key: 0,typeDoc:'',numDoc: '',dVer: '', name: '',address: '',codDep: 0,codCity: 0,tel: '',fax:'',codArl: 0,
    codSubsiPag: 0,classContrib: '',formPresents: '',fecInstall: '',fecUltAccess: '',daisValidity: 0,fecExpiredLic: '',
    clave: '',codHabilita: '',codCountry: '',numLicences: 0,server: '',dataBase: '',user: '',passw: '',route: '',
    modNom: '',modRh: '',modMis: '',serial: '',codLocal: '',logo: {},logoOpc: '',loadLogoOpc: '',state: ''}

    @Output()
    formSubmitted: EventEmitter<boolean> = new EventEmitter<boolean>()

    constructor(
      public companyService: CompanyService,
      public countryService: CountryService,
      public departamentService: DepartmentService,
      public arlService: ArlService,
      public cityService: CityService,
      public subsidiaryService: SubsidiaryService,
      public formControlsGenerator: FormControlGenerator,
      private translateService: TranslateService,
      private spinner: NgxSpinnerService
    ) {
      
      this.initData();
      this.loadTranslations();
      this.form = new FormGroup(
        this.formControlsGenerator.generate(this.defaultValues, {})
      );
  
        this.form.valueChanges.subscribe((values) => {
            this.model = values;
        });
        this.registerDeparmentChange()
    }

    ngAfterViewInit(): void { }

    initData(isNew: boolean = false) {
      this.models$ = this.companyService.getAll();
      this.models$.subscribe(data => {
        this.lastCode = (Math.max.apply(null, data.map(c => c.key)) || 0 ) + 1;
        this.isNew = isNew;

        if(isNew) {
          this.form.reset();
          this.form.setValue(this.defaultValues);
          this.form.patchValue({ 'key': this.lastCode});  
        }
      });

       //Llenar Selects Paises, Ciudades, Departamentos, Sucursales, Arl
       this.countries$ = this.countryService.getAll();
       this.countries$.subscribe(data => {
         console.log(data)
       });
 
       this.departaments$ = this.departamentService.getAll()
       this.departaments$.subscribe(data => {
         console.log(data)
       });
 
       this.arls$ = this.arlService.getAll()
       this.arls$.subscribe(data => {
         console.log(data)
       });
 
       this.cities$ = this.cityService.getAll()
       this.cities$.subscribe(data => {
         console.log(data)
       });
 
       this.subsidiaries$ = this.subsidiaryService.getAll()
       this.subsidiaries$.subscribe(data => {
         console.log(data)
       });
    }
    
    ngOnChanges(changes: any) {
      this.form.patchValue(changes.model.currentValue);
    }

    registerDeparmentChange(){
        this.form.get('codDep').valueChanges.subscribe(key => {
            this.form.get('codCity').setValue('')
            this.cities$ = this.cityService.getByDepartment(key)
        })
    }

    saveChanges() {
      this.spinner.show();

      this.companyService[this.isNew ? 'create' : 'update'](this.model)
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
        return this.companyService
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

