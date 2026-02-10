import { createElement } from "react"
import { Dialog as DialogPrimitive } from "radix-ui"

var overlayCls = "data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 fixed inset-0 z-50 bg-black/50"
var contentCls = "bg-background data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 data-[state=closed]:zoom-out-95 data-[state=open]:zoom-in-95 fixed top-[50%] left-[50%] z-50 grid w-full max-w-[calc(100%-2rem)] translate-x-[-50%] translate-y-[-50%] gap-4 rounded-lg border p-6 shadow-lg duration-200 outline-none sm:max-w-lg"
var headerCls = "flex flex-col gap-2 text-center sm:text-left"
var footerCls = "flex flex-col-reverse gap-2 sm:flex-row sm:justify-end"
var titleCls = "text-lg leading-none font-semibold"
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

export function dialogImpl(props) {
  var { children, ...rest } = props
  return createElement(DialogPrimitive.Root, { "data-slot": "dialog", ...rest }, ...([].concat(children)))
}

export function dialogTriggerImpl(props) {
  var { children, ...rest } = props
  return createElement(DialogPrimitive.Trigger, { "data-slot": "dialog-trigger", ...rest }, ...([].concat(children)))
}

export function dialogContentImpl(props) {
  var { children, ...rest } = props
  return createElement(
    DialogPrimitive.Portal,
    {},
    createElement(DialogPrimitive.Overlay, { className: overlayCls, "data-slot": "dialog-overlay" }),
    createElement(
      DialogPrimitive.Content,
      { className: contentCls, "data-slot": "dialog-content", ...rest },
      ...([].concat(children)),
      createElement(
        DialogPrimitive.Close,
        { className: closeBtnCls, "data-slot": "dialog-close" },
        xSvg,
        createElement("span", { className: "sr-only" }, "Close")
      )
    )
  )
}

export function dialogHeaderImpl(props) {
  var { children, ...rest } = props
  return createElement("div", { className: headerCls, "data-slot": "dialog-header", ...rest }, ...([].concat(children)))
}

export function dialogFooterImpl(props) {
  var { children, ...rest } = props
  return createElement("div", { className: footerCls, "data-slot": "dialog-footer", ...rest }, ...([].concat(children)))
}

export function dialogTitleImpl(props) {
  var { children, ...rest } = props
  return createElement(DialogPrimitive.Title, { className: titleCls, "data-slot": "dialog-title", ...rest }, ...([].concat(children)))
}

export function dialogDescriptionImpl(props) {
  var { children, ...rest } = props
  return createElement(DialogPrimitive.Description, { className: descriptionCls, "data-slot": "dialog-description", ...rest }, ...([].concat(children)))
}

export function dialogCloseImpl(props) {
  var { children, ...rest } = props
  return createElement(DialogPrimitive.Close, { "data-slot": "dialog-close", ...rest }, ...([].concat(children)))
}
