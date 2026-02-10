import { createElement, createContext, useContext, useState, useCallback } from "react"

var SidebarContext = createContext({ open: true, setOpen: function(){} })

var providerCls = "group/sidebar-wrapper flex min-h-svh w-full"
var sidebarCls = "group peer text-sidebar-foreground flex h-svh w-[--sidebar-width] flex-col bg-sidebar border-r transition-[width] duration-200 data-[state=collapsed]:w-[--sidebar-width-icon]"
var headerCls = "flex flex-col gap-2 p-2"
var contentCls = "flex min-h-0 flex-1 flex-col gap-2 overflow-auto p-2"
var footerCls = "flex flex-col gap-2 p-2"
var triggerCls = "inline-flex items-center justify-center rounded-md text-sm font-medium h-7 w-7"
var menuCls = "flex w-full min-w-0 flex-col gap-1"
var menuItemCls = "group/menu-item relative"
var menuButtonCls = "peer/menu-button flex w-full items-center gap-2 overflow-hidden rounded-md p-2 text-left text-sm outline-none ring-sidebar-ring hover:bg-sidebar-accent hover:text-sidebar-accent-foreground focus-visible:ring-2 disabled:pointer-events-none disabled:opacity-50"

export function sidebarProviderImpl(props) {
  var { children, ...rest } = props
  var _s = useState(true), open = _s[0], setOpen = _s[1]
  return createElement(SidebarContext.Provider, { value: { open: open, setOpen: setOpen } },
    createElement("div", { className: providerCls, style: { "--sidebar-width": "16rem", "--sidebar-width-icon": "3rem" }, "data-slot": "sidebar-wrapper", ...rest }, ...([].concat(children)))
  )
}
export function sidebarImpl(props) {
  var { children, ...rest } = props
  var ctx = useContext(SidebarContext)
  return createElement("div", { className: sidebarCls, "data-slot": "sidebar", "data-state": ctx.open ? "expanded" : "collapsed", ...rest }, ...([].concat(children)))
}
export function sidebarHeaderImpl(props) {
  var { children, ...rest } = props
  return createElement("div", { className: headerCls, "data-slot": "sidebar-header", ...rest }, ...([].concat(children)))
}
export function sidebarContentImpl(props) {
  var { children, ...rest } = props
  return createElement("div", { className: contentCls, "data-slot": "sidebar-content", ...rest }, ...([].concat(children)))
}
export function sidebarFooterImpl(props) {
  var { children, ...rest } = props
  return createElement("div", { className: footerCls, "data-slot": "sidebar-footer", ...rest }, ...([].concat(children)))
}
export function sidebarTriggerImpl(props) {
  var ctx = useContext(SidebarContext)
  return createElement("button", { className: triggerCls, "data-slot": "sidebar-trigger", onClick: function() { ctx.setOpen(!ctx.open) }, ...props },
    createElement("svg", { xmlns: "http://www.w3.org/2000/svg", width: "16", height: "16", viewBox: "0 0 24 24", fill: "none", stroke: "currentColor", strokeWidth: "2" },
      createElement("rect", { width: "18", height: "18", x: "3", y: "3", rx: "2" }),
      createElement("path", { d: "M9 3v18" })
    )
  )
}
export function sidebarMenuImpl(props) {
  var { children, ...rest } = props
  return createElement("ul", { className: menuCls, "data-slot": "sidebar-menu", ...rest }, ...([].concat(children)))
}
export function sidebarMenuItemImpl(props) {
  var { children, ...rest } = props
  return createElement("li", { className: menuItemCls, "data-slot": "sidebar-menu-item", ...rest }, ...([].concat(children)))
}
export function sidebarMenuButtonImpl(props) {
  var { children, ...rest } = props
  return createElement("button", { className: menuButtonCls, "data-slot": "sidebar-menu-button", ...rest }, ...([].concat(children)))
}
