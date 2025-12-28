import { Component, OnInit, ViewChild } from '@angular/core';
import DataSource from 'devextreme/data/data_source';
import { EmployeePositionService } from '@modules/settings/services/employee-position.service';

import CustomStore from 'devextreme/data/custom_store';
import { DxDataGridComponent } from 'devextreme-angular';
import { PositionsFormComponent } from '@modules/settings/components/positions-form/positions-form.component';

import { confirm } from 'devextreme/ui/dialog';
import { TranslateService } from '@ngx-translate/core';
import { NgxSpinnerService } from 'ngx-spinner';
import notify from 'devextreme/ui/notify';

@Component({
  selector: 'app-manager',
  templateUrl: './positions-manager.component.html',
  styleUrls: ['./positions-manager.component.scss'],
  providers: [
    EmployeePositionService
  ]
})
export class PositionsManagerComponent {
  self: any;
  popupVisible = false;
  currentPosition: any
  data: any;
  dataSource: DataSource;
  collapsed = false;
  employeePositionStore: CustomStore;
  gridContext: any;
  translations: any = {};
  @ViewChild("grid") dataGrid: DxDataGridComponent
  @ViewChild("form") positionForm: PositionsFormComponent

  customizeTooltip = (pointsInfo) => {
      return { text: parseInt(pointsInfo.originalValue) + "%" };
  }

  constructor(
    public employeePositionService: EmployeePositionService, 
    private translateService: TranslateService,
    private spinner: NgxSpinnerService
  ) {
      this.employeePositionStore = employeePositionService.getStore();
      this.currentPosition = {};
      this.self = this;
      this.loadTranslations();

  }

  onContentReady(e){
    e.component.columnOption("command:edit", "visibleIndex", -1);
  }

  getCrudConfig() {
    return {
      onEdit: (data: any) => this.employeePositionService.update(data),
      onDelete: (data: any) => this.employeePositionService.delete(data.code)
    }
  }

  loadItem(e){
    this.setCurrentPosition(e.row.data);
    this.popupVisible = true;
    this.positionForm.initData(false);
    e.event.preventDefault();
  }

  setCurrentPosition(data) {
    this.currentPosition = data;
  }

  formSubmittedHandler(isSubmitted) {
    this.popupVisible = !isSubmitted;

    this.currentPosition = {};

    if(isSubmitted) 
    this.refresh();
  }

  prepareToolbar(e) {
    let addButton = e.toolbarOptions.items.find(c => c.name === "addRowButton");
    let self = this;

    if(!addButton)
      return;
    
    addButton.options.icon = "las la-plus-circle";
    addButton.options.onClick = () => {
      this.popupVisible = true;
      this.currentPosition = null;
      self.positionForm.initData(true);
    }

  }

  deletePosition(e) {
    let result = confirm(
      this.translations['SETTINGS.POSITIONS.CONFIRM_DELETE_MESSAGE']
          .replace("@name", e.row.data.name),
      this.translations['BUTTONS.ACCEPT']
    )

    result.then(dialogResult => {
      if(!dialogResult)
        return;

        this.spinner.show(); 

        this.employeePositionService
              .delete(e.row.key)
                .subscribe(() => {
                  notify(this.translations['MESSAGES.DELETE_SUCCESS'], 'success', 600);
                  
                },
                () => {
                    notify(this.translations['MESSAGES.DELETE_ERROR'], 'error', 600);
                },
                () => {
                  this.spinner.hide();
                  this.dataGrid.instance.refresh();
                });
    })
  }

  refresh() {
    this.dataGrid.instance.refresh();
  }

  loadTranslations(){
    let self = this;
    this.translateService.get([
      'SETTINGS.POSITIONS.CONFIRM_DELETE_MESSAGE',
      "MESSAGES.DELETE_SUCCESS",
      "MESSAGES.DELETE_ERROR",
      "MESSAGES.SAVED_CHANGES_SUCCESS",
      "MESSAGES.SAVED_CHANGES_ERROR",
      'BUTTONS.ACCEPT'
    ])
    .subscribe(translations => self.translations = translations);
  }

}

