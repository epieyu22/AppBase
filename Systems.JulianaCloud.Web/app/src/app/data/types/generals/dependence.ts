export interface Country {
  key: number;
  name: string;
}
export const CountryTemplate = <Country>{
    key: 0,
    name: ''
}

export interface Zone {
  key: number;
  name: string;
}
export const ZoneTemplate = <Zone>{
    key: 0,
    name: ''
}

export interface Department {
    key: number;
    codDane: string;
    name: string;
  }
  export const DepartmentTemplate = <Department>{
      key: 0,
      codDane: '',
      name: '' 
  };

  export interface City {
    key: number;
    codDepto: string;
    codDane: string;
    name: string;
  }
  export const CityTemplate = <City>{
      key: 0,
      codDepto: '',
      codDane: '',
      name: '' 
  };