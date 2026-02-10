import { createElement } from "react"
import { NavigationMenu as P } from "radix-ui"

var rootCls = "group/nav relative flex max-w-max flex-1 items-center justify-center"
var listCls = "group flex flex-1 list-none items-center justify-center gap-1"
var triggerCls = "group inline-flex h-9 w-max items-center justify-center rounded-md bg-background px-4 py-2 text-sm font-medium hover:bg-accent hover:text-accent-foreground focus:bg-accent focus:text-accent-foreground focus:outline-none disabled:pointer-events-none disabled:opacity-50"
var contentCls = "data-[motion^=from-]:animate-in data-[motion^=to-]:animate-out data-[motion^=from-]:fade-in data-[motion^=to-]:fade-out left-0 top-0 w-full md:absolute md:w-auto"
var linkCls = "block select-none rounded-md p-3 text-sm leading-none no-underline outline-none transition-colors hover:bg-accent hover:text-accent-foreground focus:bg-accent focus:text-accent-foreground"

export function navigationMenuImpl(props) {
  var { children, ...rest } = props
  return createElement(P.Root, { className: rootCls, "data-slot": "navigation-menu", ...rest }, ...([].concat(children)), createElement(P.Viewport, { className: "absolute top-full left-0 flex w-full justify-center" }))
}
export function navigationMenuListImpl(props) {
  var { children, ...rest } = props
  return createElement(P.List, { className: listCls, "data-slot": "navigation-menu-list", ...rest }, ...([].concat(children)))
}
export function navigationMenuItemImpl(props) {
  var { children, ...rest } = props
  return createElement(P.Item, { "data-slot": "navigation-menu-item", ...rest }, ...([].concat(children)))
}
export function navigationMenuTriggerImpl(props) {
  var { children, ...rest } = props
  return createElement(P.Trigger, { className: triggerCls, "data-slot": "navigation-menu-trigger", ...rest }, ...([].concat(children)))
}
export function navigationMenuContentImpl(props) {
  var { children, ...rest } = props
  return createElement(P.Content, { className: contentCls, "data-slot": "navigation-menu-content", ...rest }, ...([].concat(children)))
}
export function navigationMenuLinkImpl(props) {
  var { children, ...rest } = props
  return createElement(P.Link, { className: linkCls, "data-slot": "navigation-menu-link", ...rest }, ...([].concat(children)))
}
