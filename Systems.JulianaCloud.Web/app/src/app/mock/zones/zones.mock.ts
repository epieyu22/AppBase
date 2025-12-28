import apiEndpointsConstants from "@shared/resources/api-endpoints.constants";
import { Model, Registry, Server } from "miragejs";
import { AnyFactories, AnyModels } from "miragejs/-types";

let zonesNames = ['Colombia', 'Caribe', 'Pacifico', 'Andina']

let data = zonesNames.map((zone, i) => ({
    "key": i + 1,
    "name": zone
}));

export default function registerZonesRoutes(server: Server<Registry<AnyModels, AnyFactories>>) {
    let endpoint = apiEndpointsConstants.getFullEndpoint(apiEndpointsConstants.GENERALS.ZONES);

    server.get(endpoint, (schema, request) => data);
    server.get(`${endpoint}/:id`, (schema, request) => data.find(r => r.key.toString() === request.params.id));
    server.post(endpoint, (schema, request) => {
        let attrs = JSON.parse(request.requestBody)
        data.push(attrs);
        return attrs;
    })
    server.put(endpoint, (schema, request) => {
        let attrs = JSON.parse(request.requestBody)
        let entry = data.find(e => e.key == attrs.key);

        if(!entry) {
            return attrs;
        }

        entry.name = attrs.name;

        return attrs;
    });
    server.delete(`${endpoint}/:id`, (schema, request) => data = data.filter(r => r.key.toString() !== request.params.id));
}
