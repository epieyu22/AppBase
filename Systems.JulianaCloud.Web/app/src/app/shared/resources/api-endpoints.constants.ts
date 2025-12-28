export default {
    BASE_API: "api",
    GET_BY_PROPERTY_ROUTE: 'by/{0}/{1}/{2}',
    SETTINGS: {
         EMPLOYEE_POSITIONS: "employee-positions",
         WITHDRAWALS: 'withdrawals',
    },
    GENERALS: {
        ZONES: 'zones',
        COUNTRIES: 'countries',
        PROFESSIONS: 'professions',
        AUTH: 'auth',
        COMPANIES: 'companies',
        EPS: 'eps',
        DEPARTMENTS: 'departments',
        CITIES: {
            DEFAULT: 'cities',
            GET_BY_DEPARTMENT: 'by-department/{0}'
        },
        ARL: 'arl',
        SUBSIDIARIES: 'subsidiaries',
        CAJAS: 'Cajas',
        COSTCENTERS: 'costcenters',
        HOLIDAYS: 'holidays'
    },
    getFullEndpoint(endpoint) {
        return `${this.BASE_API}/${endpoint}`;
    },
}
