export interface Company {
  key: number;
  typeDoc: string;
  numDoc: string;
  dVer: string ;
  name: string;
  address: string;
  codDep: number;
  codCity: number;
  tel: string;
  fax: string;
  codArl: number;
  codSubsiPag: number;
  classContrib: string;
  formPresents: string;
  fecInstall: string;
  fecUltAccess: string;
  daisValidity: number;
  fecExpiredLic: string;
  clave: string;
  codHabilita: string;
  codCountry: string;
  numLicences: number;
  server: string;
  dataBase: string;
  user: string;
  passw: string;
  route: string;
  modNom: string | boolean;
  modRh: string | boolean;
  modMis: string | boolean;
  serial: string;
  codLocal: string;
  logo: object;
  logoOpc: string | boolean;
  loadLogoOpc: string | boolean;
  state: string;
}

export const CompanyTemplate = <Company>{
    key: 0,
    typeDoc: '',
    numDoc: '',
    dVer: '',
    name: '',
    address: '',
    codDep: 0,
    codCity: 0,
    tel: '',
    fax: '',
    codArl: 0,
    codSubsiPag: 0,
    classContrib: '',
    formPresents: '',
    fecInstall: '',
    fecUltAccess: '',
    daisValidity: 0,
    fecExpiredLic: '',
    clave: '',
    codHabilita: '',
    codCountry: '',
    numLicences: 0,
    server: '',
    dataBase: '',
    user: '',
    passw: '',
    route: '',
    modNom: false,
    modRh: false,
    modMis: false,
    serial: '',
    codLocal: '',
    logo: {},
    logoOpc: false,
    loadLogoOpc: false,
    state: ''
}
