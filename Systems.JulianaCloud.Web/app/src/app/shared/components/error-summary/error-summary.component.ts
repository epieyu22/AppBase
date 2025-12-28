import { Component, Input, OnInit } from '@angular/core';
import { FormGroup } from '@angular/forms';

@Component({
  selector: 'jc-error-summary',
  templateUrl: './error-summary.component.html',
  styleUrls: ['./error-summary.component.scss']
})
export class ErrorSummaryComponent implements OnInit {

  @Input() form!: FormGroup;
  errors: string[] = [];
  show = false
  
  constructor() { }

  ngOnInit() {
    if (this.form === null || this.form instanceof FormGroup === false) {
      throw new Error('You must supply the validation summary with an NgForm.');
    }

    if (this.form.statusChanges !== null) {
      this.form.statusChanges.subscribe(status => {
        
        this.resetErrorMessages();
        this.generateErrorMessages(this.form);
      });
    }
  }

  resetErrorMessages() {
    this.errors.length = 0;
  }

  generateErrorMessages(formGroup: FormGroup) {

    Object.keys(formGroup.controls).forEach(controlName => {
      let control = formGroup.controls[controlName];
      let errors = control.errors;

      if (errors === null || errors.count === 0) {
        return;
      }

      // TODO: Get the most common errors and text localizations.

      if (!control.touched) {
        return;
      }

      if (errors.required) {
        this.errors.push(`${controlName} es requerido`);
      }

      if (errors.minlength) {
        this.errors.push(`La longitud mínima de ${controlName} es ${errors.minlength.requiredLength}.`);
      }

      if (errors.pattern) {
        this.errors.push(`${controlName} no cumple con los requerimientos mínimos.`);
      }

      // TODO: Evolve custom errors
      if (errors.notEquals) {
        this.errors.push(errors.message);
      }
    });
  }

}
