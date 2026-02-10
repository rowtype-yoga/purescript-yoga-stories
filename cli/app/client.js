import { clientMain } from "/output/YogaStories.UI.Client/index.js";
clientMain();

if (import.meta.hot) {
  import.meta.hot.on("yoga-stories:module-update", ({ moduleName }) => {
    window.__yogaStoriesHMR?.(moduleName);
  });
  import.meta.hot.on("yoga-stories:stories-update", () => {
    window.__yogaStoriesRefreshStories?.();
  });
}
