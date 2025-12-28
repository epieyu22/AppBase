import { Component, ViewChild } from '@angular/core';
import DataSource from 'devextreme/data/data_source';
import CustomStore from 'devextreme/data/custom_store';
import { DxDataGridComponent } from 'devextreme-angular';
import { confirm } from 'devextreme/ui/dialog'; 
import { TranslateService } from '@ngx-translate/core';
import { NgxSpinnerService } from 'ngx-spinner';
import notify from 'devextreme/ui/notify';

import { SubsidiaryService } from '@modules/generals/services/subsidiary.service';
import { SubsidiariesFormComponent } from '@modules/generals/components/subsidiaries/subsidiaries-form/subsidiaries-form.component';

@Component({
  selector: 'app-subsidiary-manager',
  templateUrl: './subsidiary-manager.component.html',
  providers: [
    SubsidiaryService
  ]
})
export class SubsidiaryManagerComponent {
  self: any;
  popupVisible = false;
  currentModel: any
  data: any;
  dataSource: DataSource;
  collapsed = false;
  subsidiaryStore: CustomStore;
  gridContext: any;
  translations: any = {};
  @ViewChild("grid") dataGrid: DxDataGridComponent
  @ViewChild("form") form: SubsidiariesFormComponent

  customizeTooltip = (pointsInfo) => {
      return { text: parseInt(pointsInfo.originalValue) + "%" };
  }

  constructor(
    public subsidiaryService: SubsidiaryService, 
    private translateService: TranslateService,
    private spinner: NgxSpinnerService
  ) {
      this.subsidiaryStore = subsidiaryService.getStore();
      this.currentModel = {};
      this.self = this;
      this.loadTranslations();
  }

  onContentReady(e){
    e.component.columnOption("command:edit", "visibleIndex", -1);
  }

  getCrudConfig() {
    return {
      onEdit: (data: any) => this.subsidiaryService.update(data),
      onDelete: (data: any) => this.subsidiaryService.delete(data.code)
    }
  }

  loadItem(e){
    this.setCurrentModel(e.row.data);
    this.popupVisible = true;
    this.form.initData(false);
    e.event.preventDefault();
  }

  setCurrentModel(data) {
    this.currentModel = data;
  }

  formSubmittedHandler(isSubmitted) {
    this.popupVisible = !isSubmitted;

    this.currentModel = {};

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
      this.currentModel = null;
      self.form.initData(true);
    }

  }

  deleteEntry(e) {
    let result = confirm(
      this.translations['GENERALS.SUBSIDIARIES.CONFIRM_DELETE_MESSAGE']
          .replace("@name", e.row.data.name),
      this.translations['BUTTONS.ACCEPT']
    )
    result.then(dialogResult => {
      if(!dialogResult)
        return;
        this.spinner.show();

        this.subsidiaryService
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
      'GENERALS.SUBSIDIARIES.CONFIRM_DELETE_MESSAGE',
      "MESSAGES.DELETE_SUCCESS",
      "MESSAGES.DELETE_ERROR",
      "MESSAGES.SAVED_CHANGES_SUCCESS",
      "MESSAGES.SAVED_CHANGES_ERROR",
      'BUTTONS.ACCEPT'
    ])
    .subscribe(translations => self.translations = translations);
  }

}


