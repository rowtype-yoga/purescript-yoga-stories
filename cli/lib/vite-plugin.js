import { resolve } from "node:path";
import { readFile } from "node:fs/promises";
import { discoverStories } from "./discovery.js";

export function yogaStoriesPlugin(config) {
  let cachedStories = null;

  return {
    name: "yoga-stories",

    configureServer(server) {
      const outputDir = resolve(process.cwd(), config.outputDir);

      server.watcher.add(outputDir);

      const onFileChange = (path) => {
        if (!path.endsWith(".js") && !path.endsWith("corefn.json")) return;
        const rel = path.replace(outputDir + "/", "");
        const moduleName = rel.split("/")[0];
        cachedStories = null;
        server.ws.send({
          type: "custom",
          event: "yoga-stories:module-update",
          data: { moduleName },
        });
        if (path.endsWith("corefn.json")) {
          server.ws.send({
            type: "custom",
            event: "yoga-stories:stories-update",
          });
        }
      };

      server.watcher.on("change", onFileChange);
      server.watcher.on("add", onFileChange);

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
