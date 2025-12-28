import { Component, Input, OnInit } from '@angular/core';
import { DxDataGridComponent } from 'devextreme-angular';
import { exportDataGrid as exportDataGridToPdf } from 'devextreme/pdf_exporter';
import { jsPDF } from 'jspdf';
import 'jspdf-autotable';

@Component({
  selector: 'jc-pdf-export-button',
  templateUrl: './pdf-export-button.component.html',
  styleUrls: ['./pdf-export-button.component.scss']
})
export class PdfExportButtonComponent implements OnInit {

  constructor() { }

  @Input()
  grid : DxDataGridComponent

  ngOnInit() {
  }

  export(){
    const doc = new jsPDF();
      exportDataGridToPdf({
          jsPDFDocument: doc,
          component: this.grid.instance
      }).then(() => {
          doc.save('Customers.pdf');
      })
  }

}
