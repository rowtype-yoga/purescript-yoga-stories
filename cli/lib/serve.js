import { createServer, loadConfigFromFile } from "vite";
import { yogaStoriesPlugin } from "./vite-plugin.js";
import { loadConfig } from "./discovery.js";
import { resolve, dirname } from "node:path";
import { fileURLToPath } from "node:url";

const __dirname = dirname(fileURLToPath(import.meta.url));

export async function startDevServer({
  port = 6006,
  configPath = "yoga-stories.json",
  outputDir,
  open = true,
} = {}) {
  const fileConfig = await loadConfig(configPath);
  const config = {
    outputDir: outputDir || fileConfig.outputDir || "./output",
    include: fileConfig.include || ["**.Stories"],
    exclude: fileConfig.exclude || [],
  };

  const appDir = resolve(__dirname, "..", "app");
  const userDir = process.cwd();

  const userConfig = await loadUserConfig(userDir);

  const server = await createServer({
    root: appDir,
    server: {
      port,
      open,
      fs: {
        allow: [appDir, userDir],
      },
    },
    plugins: [yogaStoriesPlugin(config), ...userConfig.plugins],
    resolve: {
      alias: {
        "/output": resolve(userDir, config.outputDir),
        "/user": userDir,
        react: resolve(userDir, "node_modules/react"),
        "react-dom": resolve(userDir, "node_modules/react-dom"),
        ...userConfig.alias,
      },
      dedupe: ["react", "react-dom"],
    },
  });

  await server.listen();
  server.printUrls();
}

async function loadUserConfig(userDir) {
  const result = await loadConfigFromFile(
    { command: "serve", mode: "development" },
    undefined,
    userDir,
  );
  if (!result) return { plugins: [], alias: {} };
  const plugins = (result.config.plugins || []).flat();
  const alias = result.config.resolve?.alias || {};
  return { plugins, alias };
}
