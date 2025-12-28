export interface Position {
    code: number;
    name: string;
    lastName: string,
    availableSalary: number;
    alternativeCode: number;
    objective: string;
    function: string;
    profile: string;
    authorizeSalaries: string | boolean;
    receiveMails: string | boolean;
    hasBoss: string | boolean;
    bossPosition: number;
    documentSignature: boolean;
    signature: string;
    activityCode: string;
    art209: string | boolean;
}

export const PositionTemplate = <Position>{
    code: 0,
    name: '',
    lastName: '',
    availableSalary: 0,
    alternativeCode: 0,
    objective: '',
    function: '',
    profile: '',
    authorizeSalaries: false,
    receiveMails: false,
    hasBoss: false,
    bossPosition: 0,
    documentSignature: false,
    signature: '',
    activityCode: '',
    art209: false
}