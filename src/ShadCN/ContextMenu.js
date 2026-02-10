import { createElement } from "react"
import { ContextMenu as P } from "radix-ui"

var contentCls = "bg-popover text-popover-foreground data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 data-[state=closed]:zoom-out-95 data-[state=open]:zoom-in-95 z-50 min-w-[8rem] overflow-hidden rounded-md border p-1 shadow-md"
var itemCls = "focus:bg-accent focus:text-accent-foreground relative flex cursor-default items-center gap-2 rounded-sm px-2 py-1.5 text-sm outline-hidden select-none data-[disabled]:pointer-events-none data-[disabled]:opacity-50"
var separatorCls = "bg-border -mx-1 my-1 h-px"
var labelCls = "text-foreground px-2 py-1.5 text-sm font-medium"

export function contextMenuImpl(props) {
  var { children, ...rest } = props
  return createElement(P.Root, { "data-slot": "context-menu", ...rest }, ...([].concat(children)))
}
export function contextMenuTriggerImpl(props) {
  var { children, ...rest } = props
  return createElement(P.Trigger, { "data-slot": "context-menu-trigger", ...rest }, ...([].concat(children)))
}
export function contextMenuContentImpl(props) {
  var { children, ...rest } = props
  return createElement(P.Portal, null, createElement(P.Content, { className: contentCls, "data-slot": "context-menu-content", ...rest }, ...([].concat(children))))
}
export function contextMenuItemImpl(props) {
  var { children, ...rest } = props
  return createElement(P.Item, { className: itemCls, "data-slot": "context-menu-item", ...rest }, ...([].concat(children)))
}
export function contextMenuSeparatorImpl(props) {
  return createElement(P.Separator, { className: separatorCls, "data-slot": "context-menu-separator", ...props })
}
export function contextMenuLabelImpl(props) {
  var { children, ...rest } = props
  return createElement(P.Label, { className: labelCls, "data-slot": "context-menu-label", ...rest }, ...([].concat(children)))
}
