import { createElement } from "react"

var listCls = "text-muted-foreground flex flex-wrap items-center gap-1.5 text-sm break-words sm:gap-2.5"
var itemCls = "inline-flex items-center gap-1.5"
var linkCls = "hover:text-foreground transition-colors"
var pageCls = "text-foreground font-normal"
var separatorCls = "[&>svg]:size-3.5"

var chevronSvg = createElement("svg", {
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

export function breadcrumbImpl(props) {
  var { children, ...rest } = props
  return createElement("nav", { "aria-label": "breadcrumb", "data-slot": "breadcrumb", ...rest }, ...([].concat(children)))
}

export function breadcrumbListImpl(props) {
  var { children, ...rest } = props
  return createElement("ol", { className: listCls, "data-slot": "breadcrumb-list", ...rest }, ...([].concat(children)))
}

export function breadcrumbItemImpl(props) {
  var { children, ...rest } = props
  return createElement("li", { className: itemCls, "data-slot": "breadcrumb-item", ...rest }, ...([].concat(children)))
}

export function breadcrumbLinkImpl(props) {
  var { children, ...rest } = props
  return createElement("a", { className: linkCls, "data-slot": "breadcrumb-link", ...rest }, ...([].concat(children)))
}

export function breadcrumbPageImpl(props) {
  var { children, ...rest } = props
  return createElement("span", { className: pageCls, "data-slot": "breadcrumb-page", role: "link", "aria-disabled": "true", "aria-current": "page", ...rest }, ...([].concat(children)))
}

export function breadcrumbSeparatorImpl(props) {
  var { children, ...rest } = props
  var content = children && ([].concat(children)).length > 0 ? ([].concat(children)) : [chevronSvg]
  return createElement("li", { className: separatorCls, role: "presentation", "aria-hidden": "true", "data-slot": "breadcrumb-separator", ...rest }, ...content)
}
