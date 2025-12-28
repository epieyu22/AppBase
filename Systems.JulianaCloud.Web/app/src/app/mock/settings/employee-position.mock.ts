import apiEndpointsConstants from "@shared/resources/api-endpoints.constants";
import { Model, Registry, Server } from "miragejs";
import { AnyFactories, AnyModels } from "miragejs/-types";
import { Position } from "@data/types/employee/position";

let data : Position[] = [
    {
        code: 1,
        name: 'Authory role',
        lastName: '',
        availableSalary: 15000,
        alternativeCode: 0,
        objective: 'Random and funny objetive',
        function: 'the function is awesome',
        profile: '',
        authorizeSalaries: true,
        receiveMails: false,
        hasBoss: false,
        bossPosition: 0,
        documentSignature: false,
        signature: '',
        activityCode: '',
        art209: false
    },
    {
        code: 2,
        name: 'Accounting role',
        lastName: '',
        availableSalary: 25400,
        alternativeCode: 0,
        objective: 'Random and funny objetive',
        function: 'the function is awesome',
        profile: 'Most awesome role',
        authorizeSalaries: true,
        receiveMails: true,
        hasBoss: false,
        bossPosition: 0,
        documentSignature: false,
        signature: '',
        activityCode: '',
        art209: true
    },
]

export default function registerPositionRoutes(server: Server<Registry<AnyModels, AnyFactories>>) {
    let endpoint = apiEndpointsConstants.getFullEndpoint(apiEndpointsConstants.SETTINGS.EMPLOYEE_POSITIONS);

    server.get(endpoint, (schema, request) => data);
    server.get(`${endpoint}/:id`, (schema, request) => data.find(r => r.code.toString() === request.params.id));
}