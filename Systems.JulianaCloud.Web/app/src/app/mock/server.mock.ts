import { createServer } from "miragejs";
import registerPositionRoutes from "./settings/employee-position.mock"
import registerZonesRoutes from "./zones/zones.mock";

export default function initMockServer({environment = "test"}){

  createServer({
    environment,
    routes() {
      registerPositionRoutes(this);
      registerZonesRoutes(this);
      this.passthrough()
    }
  });

}