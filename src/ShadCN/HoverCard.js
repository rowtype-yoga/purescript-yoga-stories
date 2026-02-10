import { createElement } from "react"
import { HoverCard as HoverCardPrimitive } from "radix-ui"

var contentCls = "bg-popover text-popover-foreground data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 data-[state=closed]:zoom-out-95 data-[state=open]:zoom-in-95 z-50 w-64 rounded-md border p-4 shadow-md outline-hidden"

export function hoverCardImpl(props) {
  var { children, ...rest } = props
  return createElement(HoverCardPrimitive.Root, { "data-slot": "hover-card", ...rest }, ...([].concat(children)))
}

export function hoverCardTriggerImpl(props) {
  var { children, ...rest } = props
  return createElement(HoverCardPrimitive.Trigger, { "data-slot": "hover-card-trigger", ...rest }, ...([].concat(children)))
}

export function hoverCardContentImpl(props) {
  var { children, align = "center", sideOffset = 6, ...rest } = props
  return createElement(
    HoverCardPrimitive.Portal,
    {},
    createElement(
      HoverCardPrimitive.Content,
      { className: contentCls, "data-slot": "hover-card-content", align, sideOffset, ...rest },
      ...([].concat(children))
    )
  )
}
