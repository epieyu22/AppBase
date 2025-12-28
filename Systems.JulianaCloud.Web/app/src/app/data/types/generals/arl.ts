export interface Arl {
    key: number;
    name: string;
    numDoc: string;
    dVer: string ;
    address: string;
    tel1: string;
    tel2: string,
    fax: string;
    contac: string;
    total: number;
    codSuper: string
  }
  
  export const ArlTemplate = <Arl>{
      key: 0,
      name: '',
      numDoc: '',
      dVer: '',
      address: '',
      tel1: '',
      tel2: '',
      fax: '',
      contac: '',
      total: 0,
      codSuper: ''
  }