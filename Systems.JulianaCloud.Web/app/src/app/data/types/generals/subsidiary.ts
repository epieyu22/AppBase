export interface Subsidiary {
    key: number;
    codZone: number;
    name: string;
    cumMeta: string | boolean;
    codCaja: number;
    codSubsiSec: string;
    hasCompany: string | boolean;
    numDoc: string;
    dVer: string;
    unified: string;
    codAgency: number;
  }
  
  export const SubsidiaryTemplate = <Subsidiary>{
    key: 0,
    codZone: 0,
    name: '',
    cumMeta: false,
    codCaja: 0,
    codSubsiSec: '',
    hasCompany: false,
    numDoc: '',
    dVer: '',
    unified: '',
    codAgency: 0
  }
  