#!/usr/bin/env node
import { Command } from "commander";
import { startDevServer } from "../lib/serve.js";
import { buildProduction } from "../lib/build.js";

const program = new Command()
  .name("yoga-stories")
  .description("PureScript component storybook");

program
  .command("serve", { isDefault: true })
  .description("Start the dev server")
  .option("-p, --port <number>", "dev server port", "6006")
  .option("-c, --config <path>", "config file path", "yoga-stories.json")
  .option("-o, --output <dir>", "PureScript output directory")
  .option("--no-open", "do not open browser on start")
  .action(async (opts) => {
    await startDevServer({
      port: parseInt(opts.port),
      configPath: opts.config,
      outputDir: opts.output,
      open: opts.open,
    });
  });

program
  .command("build")
  .description("Production build with purs-backend-es")
  .option("-c, --config <path>", "config file path", "yoga-stories.json")
  .option("-o, --output <dir>", "PureScript output directory")
  .option("--out-dir <dir>", "build output directory", "dist")
  .option("--skip-optimize", "skip purs-backend-es step")
  .action(async (opts) => {
    await buildProduction({
      configPath: opts.config,
      outputDir: opts.output,
      outDir: opts.outDir,
      skipOptimize: opts.skipOptimize,
    });
  });

program.parse();
