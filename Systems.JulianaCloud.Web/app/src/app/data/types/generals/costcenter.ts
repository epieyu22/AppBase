export interface CostCenter {
    key: number;
    name: string;
    costCenterSec: string;
    pPtoSap: string ;
    pmp: string;
    profitCenter: string;
    subsidiary: string,
}

export const CostCenterTemplate = <CostCenter>{
    key: 0,
    name: '',
    costCenterSec: '',
    pPtoSap: '',
    pmp: '',
    profitCenter: '',
    subsidiary: '',
}