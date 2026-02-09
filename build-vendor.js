import { $ } from "bun";
import { mkdirSync, writeFileSync } from "fs";

mkdirSync("dist/vendor", { recursive: true });

// Bundle react + react-dom + leva into one file
writeFileSync(
  "dist/vendor/_entry.js",
  [
    'export * as React from "react";',
    'export * as ReactDOM from "react-dom";',
    'export * as ReactDOMClient from "react-dom/client";',
    'export * as Leva from "leva";',
  ].join("\n"),
);

await $`bun build dist/vendor/_entry.js --outdir dist/vendor --entry-naming vendor.js --format esm`;

// Shims that re-export from vendor.js
writeFileSync(
  "dist/vendor/react.js",
  [
    'import { React } from "./vendor.js";',
    "export default React;",
    "export const { useState, useEffect, useRef, useCallback, useMemo, useContext, useReducer, createContext, createElement, Fragment, forwardRef, memo, lazy, Suspense, Children, cloneElement, createRef, isValidElement, Component, PureComponent, version, startTransition, useTransition, useDeferredValue, useId, useSyncExternalStore, useInsertionEffect, useLayoutEffect, useDebugValue, useImperativeHandle, act, use } = React;",
  ].join("\n"),
);

writeFileSync(
  "dist/vendor/react-dom.js",
  [
    'import { ReactDOM } from "./vendor.js";',
    "export default ReactDOM;",
    "export const { createPortal, flushSync, version } = ReactDOM;",
  ].join("\n"),
);

writeFileSync(
  "dist/vendor/react-dom-client.js",
  [
    'import { ReactDOMClient } from "./vendor.js";',
    "export default ReactDOMClient;",
    "export const { createRoot, hydrateRoot } = ReactDOMClient;",
  ].join("\n"),
);

writeFileSync(
  "dist/vendor/leva.js",
  [
    'import { Leva } from "./vendor.js";',
    "export const { useControls, button, buttonGroup, folder, monitor } = Leva;",
    "export default Leva;",
  ].join("\n"),
);

await $`rm dist/vendor/_entry.js`;
console.log("Vendor bundles built");
