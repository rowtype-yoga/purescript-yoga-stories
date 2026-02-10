import { createElement } from "react"
import { Accordion as AccordionPrimitive } from "radix-ui"

var itemCls = "border-b last:border-b-0"
var triggerCls = "flex flex-1 items-start justify-between gap-4 rounded-md py-4 text-left text-sm font-medium transition-all outline-none hover:underline [&[data-state=open]>svg]:rotate-180"
var contentCls = "data-[state=closed]:animate-accordion-up data-[state=open]:animate-accordion-down overflow-hidden text-sm"

var chevronSvg = createElement("svg", {
  xmlns: "http://www.w3.org/2000/svg",
  width: 16,
  height: 16,
  viewBox: "0 0 24 24",
  fill: "none",
  stroke: "currentColor",
  strokeWidth: 2,
  strokeLinecap: "round",
  strokeLinejoin: "round",
  className: "shrink-0 text-muted-foreground transition-transform duration-200"
}, createElement("path", { d: "m6 9 6 6 6-6" }))

export function accordionImpl(props) {
  var { children, ...rest } = props
  return createElement(AccordionPrimitive.Root, { "data-slot": "accordion", ...rest }, ...([].concat(children)))
}

export function accordionItemImpl(props) {
  var { children, ...rest } = props
  return createElement(AccordionPrimitive.Item, { className: itemCls, "data-slot": "accordion-item", ...rest }, ...([].concat(children)))
}

export function accordionTriggerImpl(props) {
  var { children, ...rest } = props
  return createElement(
    AccordionPrimitive.Header,
    { className: "flex", "data-slot": "accordion-header" },
    createElement(
      AccordionPrimitive.Trigger,
      { className: triggerCls, "data-slot": "accordion-trigger", ...rest },
      ...([].concat(children)),
      chevronSvg
    )
  )
}

export function accordionContentImpl(props) {
  var { children, ...rest } = props
  return createElement(
    AccordionPrimitive.Content,
    { className: contentCls, "data-slot": "accordion-content", ...rest },
    createElement("div", { className: "pt-0 pb-4" }, ...([].concat(children)))
  )
}
