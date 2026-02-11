import "@fontsource/martian-mono";
import "./code-viewer.js";

if (!window.__yogaStoriesInitialised) {
  window.__yogaStoriesInitialised = true;
  const { clientMain } = await import("/output/YogaStories.UI.Client/index.js");
  clientMain();
}

if (import.meta.hot) {
  import.meta.hot.accept();
  import.meta.hot.on("yoga-stories:module-update", ({ moduleName }) => {
    window.__yogaStoriesHMR?.(moduleName);
  });
  import.meta.hot.on("yoga-stories:stories-update", () => {
    window.__yogaStoriesRefreshStories?.();
  });
}
