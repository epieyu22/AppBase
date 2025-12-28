import { AfterViewInit, Component, EventEmitter, Input, OnInit, Output } from "@angular/core";
import { AsyncValidatorFn, FormControl, FormGroup, Validators } from "@angular/forms";
import { EmployeePositionService } from "@modules/settings/services/employee-position.service";
import { Position, PositionTemplate } from "@data/types/employee/position";

import { Observable, of, Subject } from "rxjs";
import notify from 'devextreme/ui/notify'
import { NgxSpinnerService } from "ngx-spinner";
import { TranslateService } from "@ngx-translate/core";
import FormControlGenerator from "@shared/services/forms/formcontrol-generator.service";
import Conditions from "@shared/resources/conditions.constants"
import { map } from "rxjs/operators";


@Component({
    selector: 'positions-form',
    templateUrl: './positions-form.component.html',
  })
  export class PositionsFormComponent implements AfterViewInit {

    @Input()
    position: Position
    loadingPositions$: Subject<void> = new Subject();
    positions$: Observable<Position[]>;
    form: FormGroup
    bossPositionSelect: any
    lastCode: number
    isNew: boolean
    translations: any = {}

    @Output()
    formSubmitted: EventEmitter<boolean> = new EventEmitter<boolean>()

    constructor(
      public employeePositionService: EmployeePositionService,
      public formControlsGenerator: FormControlGenerator,
      private translateService: TranslateService,
      private spinner: NgxSpinnerService
    ) {
      
      this.initData();

      this.loadTranslations();

      this.form = new FormGroup(
        this.formControlsGenerator.generate(PositionTemplate,
        {
            "name": {
              validators: [Validators.required],
              asyncValidators: [this.checkDuplicatedName("Name")],
              updateOn: 'blur'
            }
        })
      );

      this.enableBossPosition(false);

      this.form.valueChanges.subscribe((values) => {
        this.position = values;

        this.enableBossPosition(this.position.hasBoss);
      });
    }

    enableBossPosition(enable) {
      if(typeof enable === "undefined")
        return;

      this.form.controls.bossPosition[enable ? 'enable' : 'disable']({ emitEvent: false});
    }

    ngAfterViewInit(): void { }

    generateControls(position: Position) {
      let schema = Object.keys(position)
                   .reduce((prev, key) => ({...prev, [key]: new FormControl(position[key]), }), {});
      return schema;
    }

    initData(isNew: boolean = false) {
      this.positions$ = this.employeePositionService.getAll();

      this.positions$.subscribe(data => {
        this.lastCode = (Math.max.apply(null, data.map(c => c.code)) || 0 ) + 1;

        this.isNew = isNew;

        if(isNew) {
          this.form.reset();
          this.form.setValue(PositionTemplate);
          this.form.patchValue({ 'code': this.lastCode});  
        }

      })
    }
    
    ngOnChanges(changes: any) {
      this.form.patchValue(changes.position.currentValue || {});
    }

    saveChanges() {
      

      if(this.form.invalid){

        console.log("Formulario invalido, revise los controles")

        return;
      }

      this.spinner.show();
      this.employeePositionService[this.isNew ? 'create' : 'update'](this.position)
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

        return this.employeePositionService
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