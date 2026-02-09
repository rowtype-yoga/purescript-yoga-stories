export function dynamicImportImpl(path) {
  return () => import(path);
}

export function getStoryDataImpl() {
  return JSON.parse(document.getElementById("stories-data").textContent);
}

export function unsafeGetPropertyImpl(key, obj) {
  return obj[key];
}

export function getElementByIdImpl(id) {
  return () => document.getElementById(id);
}
