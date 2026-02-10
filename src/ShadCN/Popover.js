import { createElement } from "react"
import { Popover as PopoverPrimitive } from "radix-ui"

var contentCls = "bg-popover text-popover-foreground data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 data-[state=closed]:zoom-out-95 data-[state=open]:zoom-in-95 z-50 w-72 rounded-md border p-4 shadow-md outline-hidden"

export function popoverImpl(props) {
  var { children, ...rest } = props
  return createElement(PopoverPrimitive.Root, { "data-slot": "popover", ...rest }, ...([].concat(children)))
}

export function popoverTriggerImpl(props) {
  var { children, ...rest } = props
  return createElement(PopoverPrimitive.Trigger, { "data-slot": "popover-trigger", ...rest }, ...([].concat(children)))
}

export function popoverContentImpl(props) {
  var { children, align = "center", sideOffset = 6, ...rest } = props
  return createElement(
    PopoverPrimitive.Portal,
    {},
    createElement(
      PopoverPrimitive.Content,
      { className: contentCls, "data-slot": "popover-content", align, sideOffset, ...rest },
      ...([].concat(children))
    )
  )
}
