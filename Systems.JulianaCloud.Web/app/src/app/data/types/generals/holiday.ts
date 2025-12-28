export interface Holiday {
    key: number;
    holidayDate: string;
    name: string;
}

export const HolidayTemplate = <Holiday>{
    key: 0,
    holidayDate: '',
    name: '',
}