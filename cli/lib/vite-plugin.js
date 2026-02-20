import { resolve } from "node:path";
import { readFile, access } from "node:fs/promises";
import { discoverStories } from "./discovery.js";

const VIRTUAL_HEAD_ID = "virtual:yoga-stories-head";
const RESOLVED_HEAD_ID = "\0" + VIRTUAL_HEAD_ID;

const VIRTUAL_MODULES_ID = "virtual:yoga-stories-modules";
const RESOLVED_MODULES_ID = "\0" + VIRTUAL_MODULES_ID;

export function yogaStoriesPlugin(config) {
  let cachedStories = null;
  let outputDir;
  let outputVersion = 0;

  return {
    name: "yoga-stories",

    resolveId(id) {
      if (id === VIRTUAL_HEAD_ID) return RESOLVED_HEAD_ID;
      if (id === VIRTUAL_MODULES_ID) return RESOLVED_MODULES_ID;
    },

    async load(id) {
      if (id === RESOLVED_HEAD_ID) {
        const userDir = process.cwd();
        const headJsPath = resolve(userDir, "yoga-stories-head.js");
        try {
          await access(headJsPath);
          return `import "/user/yoga-stories-head.js";`;
        } catch {
          return "";
        }
      }

      if (id === RESOLVED_MODULES_ID) {
        if (this.meta.watchMode) {
          return "export default {};";
        }
        const stories = config.stories || cachedStories || (await discoverStories(config));
        cachedStories = stories;
        const imports = stories.map(
          (s, i) => `import * as m${i} from "/output/${s.moduleName}/index.js";`,
        );
        const entries = stories.map(
          (s, i) => `  ${JSON.stringify(s.moduleName)}: m${i}`,
        );
        return [...imports, `export default {`, ...entries.map((e, i) => e + (i < entries.length - 1 ? "," : "")), `};`].join("\n");
      }
    },

    configureServer(server) {
      outputDir = resolve(process.cwd(), config.outputDir);

      server.watcher.add(outputDir);

      // Debounce: PLS writes many files at once, batch into one HMR event
      let pendingModules = new Set();
      let pendingStories = false;
      let debounceTimer = null;

      const flushChanges = () => {
        const modules = [...pendingModules];
        const storiesChanged = pendingStories;
        pendingModules.clear();
        pendingStories = false;
        debounceTimer = null;
        cachedStories = null;
        outputVersion++;

        for (const moduleName of modules) {
          server.ws.send({
            type: "custom",
            event: "yoga-stories:module-update",
            data: { moduleName },
          });
        }
        if (storiesChanged) {
          server.ws.send({
            type: "custom",
            event: "yoga-stories:stories-update",
          });
        }
      };

      const onFileChange = (path) => {
        if (!path.endsWith(".js") && !path.endsWith("corefn.json")) return;
        const rel = path.replace(outputDir + "/", "");
        const moduleName = rel.split("/")[0];
        pendingModules.add(moduleName);
        if (path.endsWith("corefn.json")) {
          pendingStories = true;
        }
        if (debounceTimer) clearTimeout(debounceTimer);
        debounceTimer = setTimeout(flushChanges, 100);
      };

      server.watcher.on("change", onFileChange);
      server.watcher.on("add", onFileChange);

      // Rewrite imports in output/ JS files to add cache-busting version
      server.middlewares.use(async (req, res, next) => {
        if (!req.url?.startsWith("/output/") || !req.url?.includes("index.js"))
          return next();
        // Strip query params to get filesystem path
        const urlPath = req.url.split("?")[0];
        const filePath = resolve(process.cwd(), urlPath.slice(1));
        try {
          let code = await readFile(filePath, "utf-8");
          code = code.replace(
            /from\s+"(\.\.\/[^"]+\/index\.js)"/g,
            `from "$1?v=${outputVersion}"`,
          );
          res.setHeader("Content-Type", "application/javascript");
          res.end(code);
        } catch {
          next();
        }
      });

      // Serve /stories.json via middleware
      server.middlewares.use(async (req, res, next) => {
        if (req.url !== "/stories.json") return next();
        if (!cachedStories) {
          cachedStories = await discoverStories(config);
        }
        res.setHeader("Content-Type", "application/json");
        res.end(JSON.stringify(cachedStories));
      });
    },

    // Prevent Vite from doing a full reload for output/ changes —
    // we handle it ourselves via custom HMR events
    handleHotUpdate({ file }) {
      if (outputDir && file.startsWith(outputDir)) {
        return [];
      }
    },

    async transformIndexHtml(html) {
      const userDir = process.cwd();
      let result = html;

      // Inject yoga-stories-head.html if it exists
      const headHtmlPath = resolve(userDir, "yoga-stories-head.html");
      try {
        const headContent = await readFile(headHtmlPath, "utf-8");
        result = result.replace("</head>", headContent + "\n</head>");
      } catch {}

      return result;
    },
  };
}
