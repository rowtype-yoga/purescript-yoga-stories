import { build, loadConfigFromFile } from "vite";
import { yogaStoriesPlugin } from "./vite-plugin.js";
import { loadConfig, discoverStories } from "./discovery.js";
import { resolve, dirname } from "node:path";
import { fileURLToPath } from "node:url";
import { execSync } from "node:child_process";

const __dirname = dirname(fileURLToPath(import.meta.url));

export async function buildProduction({
  configPath = "yoga-stories.json",
  outputDir,
  outDir = "dist",
  skipOptimize = false,
} = {}) {
  const fileConfig = await loadConfig(configPath);
  const config = {
    outputDir: outputDir || fileConfig.outputDir || "./output",
    include: fileConfig.include || ["**.Stories"],
    exclude: fileConfig.exclude || [],
  };

  const userDir = process.cwd();
  const appDir = resolve(__dirname, "..", "app");

  if (!skipOptimize) {
    console.log("Running purs-backend-es build...");
    execSync("purs-backend-es build", { cwd: userDir, stdio: "inherit" });
  }

  const esOutputDir = resolve(userDir, "output-es");

  console.log("Discovering stories...");
  const stories = await discoverStories(config);
  console.log(`Found ${stories.length} story modules`);

  const buildConfig = { ...config, outputDir: esOutputDir, stories };
  const userConfig = await loadUserConfig(userDir);

  console.log("Building with Vite...");
  await build({
    root: appDir,
    base: "./",
    build: {
      outDir: resolve(userDir, outDir),
      emptyOutDir: true,
    },
    plugins: [
      yogaStoriesPlugin(buildConfig),
      storiesJsonPlugin(stories),
      ...userConfig.plugins,
    ],
    resolve: {
      alias: {
        "/output": esOutputDir,
        "/user": userDir,
        react: resolve(userDir, "node_modules/react"),
        "react-dom": resolve(userDir, "node_modules/react-dom"),
        ...userConfig.alias,
      },
      dedupe: ["react", "react-dom"],
    },
  });

  console.log(`Built to ${outDir}/`);
}

function storiesJsonPlugin(stories) {
  return {
    name: "yoga-stories-json",
    generateBundle() {
      this.emitFile({
        type: "asset",
        fileName: "stories.json",
        source: JSON.stringify(stories),
      });
    },
  };
}

async function loadUserConfig(userDir) {
  const result = await loadConfigFromFile(
    { command: "build", mode: "production" },
    undefined,
    userDir,
  );
  if (!result) return { plugins: [], alias: {} };
  const plugins = (result.config.plugins || []).flat();
  const alias = result.config.resolve?.alias || {};
  return { plugins, alias };
}
