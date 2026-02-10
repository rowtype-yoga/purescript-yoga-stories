import { createElement } from "react"

var rootCls = "mx-auto flex w-full justify-center"
var contentCls = "flex flex-row items-center gap-1"
var itemCls = "inline-flex"
var linkBase = "inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium transition-colors focus-visible:outline-none focus-visible:ring-[3px] focus-visible:ring-ring/50 disabled:pointer-events-none disabled:opacity-50 hover:bg-accent hover:text-accent-foreground h-9 px-3 py-2"
var linkActiveCls = " border bg-background shadow-xs"
var ellipsisCls = "flex size-9 items-center justify-center"

var chevronLeftSvg = createElement("svg", {
  xmlns: "http://www.w3.org/2000/svg",
  width: 16,
  height: 16,
  viewBox: "0 0 24 24",
  fill: "none",
  stroke: "currentColor",
  strokeWidth: 2,
  strokeLinecap: "round",
  strokeLinejoin: "round"
}, createElement("path", { d: "m15 18-6-6 6-6" }))

var chevronRightSvg = createElement("svg", {
  xmlns: "http://www.w3.org/2000/svg",
  width: 16,
  height: 16,
  viewBox: "0 0 24 24",
  fill: "none",
  stroke: "currentColor",
  strokeWidth: 2,
  strokeLinecap: "round",
  strokeLinejoin: "round"
}, createElement("path", { d: "m9 18 6-6-6-6" }))

var moreSvg = createElement("svg", {
  xmlns: "http://www.w3.org/2000/svg",
  width: 16,
  height: 16,
  viewBox: "0 0 24 24",
  fill: "none",
  stroke: "currentColor",
  strokeWidth: 2,
  strokeLinecap: "round",
  strokeLinejoin: "round"
}, createElement("circle", { cx: 12, cy: 12, r: 1 }), createElement("circle", { cx: 19, cy: 12, r: 1 }), createElement("circle", { cx: 5, cy: 12, r: 1 }))

export function paginationImpl(props) {
  var { children, ...rest } = props
  return createElement("nav", { className: rootCls, role: "navigation", "aria-label": "pagination", "data-slot": "pagination", ...rest }, ...([].concat(children)))
}

export function paginationContentImpl(props) {
  var { children, ...rest } = props
  return createElement("ul", { className: contentCls, "data-slot": "pagination-content", ...rest }, ...([].concat(children)))
}

export function paginationItemImpl(props) {
  var { children, ...rest } = props
  return createElement("li", { className: itemCls, "data-slot": "pagination-item", ...rest }, ...([].concat(children)))
}

export function paginationLinkImpl(props) {
  var { children, isActive = false, ...rest } = props
  var cls = linkBase + (isActive ? linkActiveCls : "")
  return createElement("a", { className: cls, "aria-current": isActive ? "page" : undefined, "data-slot": "pagination-link", ...rest }, ...([].concat(children)))
}

export function paginationPreviousImpl(props) {
  var { ...rest } = props
  return createElement(
    "a",
    { className: linkBase + " gap-1 pl-2.5", "aria-label": "Go to previous page", "data-slot": "pagination-previous", ...rest },
    chevronLeftSvg,
    createElement("span", {}, "Previous")
  )
}

export function paginationNextImpl(props) {
  var { ...rest } = props
  return createElement(
    "a",
    { className: linkBase + " gap-1 pr-2.5", "aria-label": "Go to next page", "data-slot": "pagination-next", ...rest },
    createElement("span", {}, "Next"),
    chevronRightSvg
  )
}

export function paginationEllipsisImpl(props) {
  var { ...rest } = props
  return createElement(
    "span",
    { className: ellipsisCls, "aria-hidden": "true", "data-slot": "pagination-ellipsis", ...rest },
    moreSvg,
    createElement("span", { className: "sr-only" }, "More pages")
  )
}
