import { resolve } from "node:path";
import { readFile } from "node:fs/promises";
import { discoverStories } from "./discovery.js";

export function yogaStoriesPlugin(config) {
  let cachedStories = null;

  return {
    name: "yoga-stories",

    configureServer(server) {
      const outputDir = resolve(process.cwd(), config.outputDir);

      // Watch output/ for changes
      server.watcher.add(outputDir);
      server.watcher.on("change", (path) => {
        if (path.endsWith(".js") || path.endsWith("corefn.json")) {
          cachedStories = null;
          server.ws.send({ type: "full-reload" });
        }
      });
      server.watcher.on("add", (path) => {
        if (path.endsWith("index.js") || path.endsWith("corefn.json")) {
          cachedStories = null;
          server.ws.send({ type: "full-reload" });
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

    async transformIndexHtml(html) {
      const headPath = resolve(process.cwd(), "yoga-stories-head.html");
      try {
        const headContent = await readFile(headPath, "utf-8");
        return html.replace("</head>", headContent + "\n</head>");
      } catch {
        return html;
      }
    },
  };
}
