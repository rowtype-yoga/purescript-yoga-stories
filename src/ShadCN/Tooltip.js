import { createElement } from "react"
import { Tooltip as TooltipPrimitive } from "radix-ui"

var contentCls = "bg-foreground text-background animate-in fade-in-0 zoom-in-95 data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=closed]:zoom-out-95 z-50 w-fit rounded-md px-3 py-1.5 text-xs text-balance"

export function tooltipProviderImpl(props) {
  var { children, ...rest } = props
  return createElement(TooltipPrimitive.Provider, { ...rest }, ...([].concat(children)))
}

export function tooltipImpl(props) {
  var { children, ...rest } = props
  return createElement(TooltipPrimitive.Root, { "data-slot": "tooltip", ...rest }, ...([].concat(children)))
}

export function tooltipTriggerImpl(props) {
  var { children, ...rest } = props
  return createElement(TooltipPrimitive.Trigger, { "data-slot": "tooltip-trigger", ...rest }, ...([].concat(children)))
}

export function tooltipContentImpl(props) {
  var { children, ...rest } = props
  return createElement(
    TooltipPrimitive.Portal,
    {},
    createElement(
      TooltipPrimitive.Content,
      { className: contentCls, "data-slot": "tooltip-content", sideOffset: 6, ...rest },
      ...([].concat(children))
    )
  )
}
