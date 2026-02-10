import { createElement } from "react"
import { Dialog as SheetPrimitive } from "radix-ui"

var overlayCls = "data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 fixed inset-0 z-50 bg-black/50"
var contentBase = "bg-background fixed z-50 flex flex-col gap-4 shadow-lg transition ease-in-out data-[state=closed]:duration-300 data-[state=open]:duration-500"

var sides = {
  right: "data-[state=closed]:slide-out-to-right data-[state=open]:slide-in-from-right inset-y-0 right-0 h-full w-3/4 border-l sm:max-w-sm",
  left: "data-[state=closed]:slide-out-to-left data-[state=open]:slide-in-from-left inset-y-0 left-0 h-full w-3/4 border-r sm:max-w-sm",
  top: "data-[state=closed]:slide-out-to-top data-[state=open]:slide-in-from-top inset-x-0 top-0 h-auto border-b",
  bottom: "data-[state=closed]:slide-out-to-bottom data-[state=open]:slide-in-from-bottom inset-x-0 bottom-0 h-auto border-t"
}

var headerCls = "flex flex-col gap-1.5 p-4"
var footerCls = "mt-auto flex flex-col gap-2 p-4"
var titleCls = "text-foreground font-semibold"
var descriptionCls = "text-muted-foreground text-sm"
var closeBtnCls = "absolute top-4 right-4 rounded-xs opacity-70 transition-opacity hover:opacity-100 focus:ring-2 focus:ring-offset-2 focus:outline-hidden disabled:pointer-events-none"

var xSvg = createElement("svg", {
  xmlns: "http://www.w3.org/2000/svg",
  width: 16,
  height: 16,
  viewBox: "0 0 24 24",
  fill: "none",
  stroke: "currentColor",
  strokeWidth: 2,
  strokeLinecap: "round",
  strokeLinejoin: "round"
}, createElement("path", { d: "M18 6 6 18" }), createElement("path", { d: "m6 6 12 12" }))

export function sheetImpl(props) {
  var { children, ...rest } = props
  return createElement(SheetPrimitive.Root, { "data-slot": "sheet", ...rest }, ...([].concat(children)))
}

export function sheetTriggerImpl(props) {
  var { children, ...rest } = props
  return createElement(SheetPrimitive.Trigger, { "data-slot": "sheet-trigger", ...rest }, ...([].concat(children)))
}

export function sheetContentImpl(props) {
  var { children, side = "right", ...rest } = props
  var cls = contentBase + " " + (sides[side] || sides.right)
  return createElement(
    SheetPrimitive.Portal,
    {},
    createElement(SheetPrimitive.Overlay, { className: overlayCls, "data-slot": "sheet-overlay" }),
    createElement(
      SheetPrimitive.Content,
      { className: cls, "data-slot": "sheet-content", ...rest },
      ...([].concat(children)),
      createElement(
        SheetPrimitive.Close,
        { className: closeBtnCls, "data-slot": "sheet-close" },
        xSvg,
        createElement("span", { className: "sr-only" }, "Close")
      )
    )
  )
}

export function sheetHeaderImpl(props) {
  var { children, ...rest } = props
  return createElement("div", { className: headerCls, "data-slot": "sheet-header", ...rest }, ...([].concat(children)))
}

export function sheetFooterImpl(props) {
  var { children, ...rest } = props
  return createElement("div", { className: footerCls, "data-slot": "sheet-footer", ...rest }, ...([].concat(children)))
}

export function sheetTitleImpl(props) {
  var { children, ...rest } = props
  return createElement(SheetPrimitive.Title, { className: titleCls, "data-slot": "sheet-title", ...rest }, ...([].concat(children)))
}

export function sheetDescriptionImpl(props) {
  var { children, ...rest } = props
  return createElement(SheetPrimitive.Description, { className: descriptionCls, "data-slot": "sheet-description", ...rest }, ...([].concat(children)))
}

export function sheetCloseImpl(props) {
  var { children, ...rest } = props
  return createElement(SheetPrimitive.Close, { "data-slot": "sheet-close", ...rest }, ...([].concat(children)))
}
