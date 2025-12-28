import { Component, Input, OnInit } from '@angular/core';

@Component({
  selector: 'jc-crud-buttons',
  templateUrl: './crud-buttons.component.html',
  styleUrls: ['./crud-buttons.component.scss']
})
export class CrudButtonsComponent implements OnInit {

  @Input()
  config: any

  @Input()  
  data: any;

  constructor() { }

  ngOnInit() {
    this.config = this.config || this.getDefaultConfig();

    this.config.onEdit = this.config.onEdit.bind(null, this.data);
    this.config.onDelete = this.config.onDelete.bind(null, this.data);

  }

  getDefaultConfig() {
    return {
      enableEdit: true,
      enableDelete: true,
      onEdit: () => {},
      onDelete: () => {},
    }
  }

}
