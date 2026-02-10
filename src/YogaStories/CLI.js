import { startDevServer } from "../../lib/serve.js";
import { buildProduction } from "../../lib/build.js";

export function startDevServerImpl(opts) {
  return () => startDevServer(opts);
}

export function buildProductionImpl(opts) {
  return () => buildProduction(opts);
}
