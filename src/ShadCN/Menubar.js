import { createElement } from "react"
import { Menubar as P } from "radix-ui"

var rootCls = "bg-background flex h-9 items-center gap-1 rounded-md border p-1 shadow-xs"
var triggerCls = "focus:bg-accent focus:text-accent-foreground data-[state=open]:bg-accent data-[state=open]:text-accent-foreground flex items-center rounded-sm px-2 py-1 text-sm font-medium outline-hidden select-none"
var contentCls = "bg-popover text-popover-foreground data-[state=open]:animate-in data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 z-50 min-w-[12rem] overflow-hidden rounded-md border p-1 shadow-md"
var itemCls = "focus:bg-accent focus:text-accent-foreground relative flex cursor-default items-center gap-2 rounded-sm px-2 py-1.5 text-sm outline-hidden select-none data-[disabled]:pointer-events-none data-[disabled]:opacity-50"
var separatorCls = "bg-border -mx-1 my-1 h-px"

export function menubarImpl(props) {
  var { children, ...rest } = props
  return createElement(P.Root, { className: rootCls, "data-slot": "menubar", ...rest }, ...([].concat(children)))
}
export function menubarMenuImpl(props) {
  var { children, ...rest } = props
  return createElement(P.Menu, { "data-slot": "menubar-menu", ...rest }, ...([].concat(children)))
}
export function menubarTriggerImpl(props) {
  var { children, ...rest } = props
  return createElement(P.Trigger, { className: triggerCls, "data-slot": "menubar-trigger", ...rest }, ...([].concat(children)))
}
export function menubarContentImpl(props) {
  var { children, ...rest } = props
  return createElement(P.Portal, null, createElement(P.Content, { className: contentCls, sideOffset: 8, alignOffset: -4, "data-slot": "menubar-content", ...rest }, ...([].concat(children))))
}
export function menubarItemImpl(props) {
  var { children, ...rest } = props
  return createElement(P.Item, { className: itemCls, "data-slot": "menubar-item", ...rest }, ...([].concat(children)))
}
export function menubarSeparatorImpl(props) {
  return createElement(P.Separator, { className: separatorCls, "data-slot": "menubar-separator", ...props })
}
