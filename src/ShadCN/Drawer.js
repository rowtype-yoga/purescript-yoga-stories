import { createElement } from "react"
import { Drawer as DrawerPrimitive } from "vaul"

var overlayCls = "data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 fixed inset-0 z-50 bg-black/50"
var contentCls = "group/drawer-content bg-background fixed z-50 flex h-auto flex-col" +
  " data-[vaul-drawer-direction=top]:inset-x-0 data-[vaul-drawer-direction=top]:top-0 data-[vaul-drawer-direction=top]:mb-24 data-[vaul-drawer-direction=top]:max-h-[80vh] data-[vaul-drawer-direction=top]:rounded-b-lg data-[vaul-drawer-direction=top]:border-b" +
  " data-[vaul-drawer-direction=bottom]:inset-x-0 data-[vaul-drawer-direction=bottom]:bottom-0 data-[vaul-drawer-direction=bottom]:mt-24 data-[vaul-drawer-direction=bottom]:max-h-[80vh] data-[vaul-drawer-direction=bottom]:rounded-t-lg data-[vaul-drawer-direction=bottom]:border-t" +
  " data-[vaul-drawer-direction=right]:inset-y-0 data-[vaul-drawer-direction=right]:right-0 data-[vaul-drawer-direction=right]:w-3/4 data-[vaul-drawer-direction=right]:border-l data-[vaul-drawer-direction=right]:sm:max-w-sm" +
  " data-[vaul-drawer-direction=left]:inset-y-0 data-[vaul-drawer-direction=left]:left-0 data-[vaul-drawer-direction=left]:w-3/4 data-[vaul-drawer-direction=left]:border-r data-[vaul-drawer-direction=left]:sm:max-w-sm"
var handleCls = "bg-muted mx-auto mt-4 hidden h-2 w-[100px] shrink-0 rounded-full group-data-[vaul-drawer-direction=bottom]/drawer-content:block"
var headerCls = "flex flex-col gap-0.5 p-4 group-data-[vaul-drawer-direction=bottom]/drawer-content:text-center group-data-[vaul-drawer-direction=top]/drawer-content:text-center md:gap-1.5 md:text-left"
var footerCls = "mt-auto flex flex-col gap-2 p-4"
var titleCls = "text-foreground font-semibold"
var descriptionCls = "text-muted-foreground text-sm"

export function drawerImpl(props) {
  var { children, ...rest } = props
  return createElement(DrawerPrimitive.Root, { "data-slot": "drawer", ...rest }, ...([].concat(children)))
}

export function drawerTriggerImpl(props) {
  var { children, ...rest } = props
  return createElement(DrawerPrimitive.Trigger, { "data-slot": "drawer-trigger", ...rest }, ...([].concat(children)))
}

export function drawerContentImpl(props) {
  var { children, ...rest } = props
  return createElement(
    DrawerPrimitive.Portal,
    { "data-slot": "drawer-portal" },
    createElement(DrawerPrimitive.Overlay, { className: overlayCls, "data-slot": "drawer-overlay" }),
    createElement(
      DrawerPrimitive.Content,
      { className: contentCls, "data-slot": "drawer-content", ...rest },
      createElement("div", { className: handleCls }),
      ...([].concat(children))
    )
  )
}

export function drawerHeaderImpl(props) {
  var { children, ...rest } = props
  return createElement("div", { className: headerCls, "data-slot": "drawer-header", ...rest }, ...([].concat(children)))
}

export function drawerFooterImpl(props) {
  var { children, ...rest } = props
  return createElement("div", { className: footerCls, "data-slot": "drawer-footer", ...rest }, ...([].concat(children)))
}

export function drawerTitleImpl(props) {
  var { children, ...rest } = props
  return createElement(DrawerPrimitive.Title, { className: titleCls, "data-slot": "drawer-title", ...rest }, ...([].concat(children)))
}

export function drawerDescriptionImpl(props) {
  var { children, ...rest } = props
  return createElement(DrawerPrimitive.Description, { className: descriptionCls, "data-slot": "drawer-description", ...rest }, ...([].concat(children)))
}

export function drawerCloseImpl(props) {
  var { children, ...rest } = props
  return createElement(DrawerPrimitive.Close, { "data-slot": "drawer-close", ...rest }, ...([].concat(children)))
}
