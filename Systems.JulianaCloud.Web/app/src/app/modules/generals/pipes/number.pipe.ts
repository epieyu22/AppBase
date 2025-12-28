import { Pipe, PipeTransform } from '@angular/core';


@Pipe({
    name: 'safenumber'
})
export class NumberPipe implements PipeTransform {
    
    transform( valor: any ): number {
        return valor.toString()
    }
}