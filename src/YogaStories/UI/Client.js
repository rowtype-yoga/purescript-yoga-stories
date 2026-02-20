export function dynamicImportImpl(path) {
  return () => import(/* @vite-ignore */ path + "?t=" + Date.now());
}

export function fetchStoryDataImpl() {
  return fetch("stories.json").then((r) => r.json());
}

export function unsafeGetPropertyImpl(key, obj) {
  return obj[key];
}

export function getElementByIdImpl(id) {
  return () => document.getElementById(id);
}

export function onModuleUpdateImpl(callback) {
  return () => {
    window.__yogaStoriesHMR = (moduleName) => callback(moduleName)();
  };
}

export function onStoriesUpdateImpl(callback) {
  return () => {
    window.__yogaStoriesRefreshStories = () => callback();
  };
}

export const codeViewerComponent = window.__yogaStoriesCodeViewer || "pre";

import React from "react";

export function detailsElImpl(isOpen) {
  return function(children) {
    return React.createElement("details", { open: isOpen || undefined, className: "ys-module-group" }, ...children);
  };
}

export function summaryElImpl(child) {
  return React.createElement("summary", { className: "ys-module-label" }, child);
}
