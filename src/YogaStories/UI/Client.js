export function dynamicImportImpl(path) {
  return () => import(/* @vite-ignore */ path);
}

export function fetchStoryDataImpl() {
  return fetch("/stories.json").then((r) => r.json());
}

export function unsafeGetPropertyImpl(key, obj) {
  return obj[key];
}

export function getElementByIdImpl(id) {
  return () => document.getElementById(id);
}
