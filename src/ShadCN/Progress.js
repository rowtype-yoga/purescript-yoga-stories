import { createElement } from "react"
import { Progress as ProgressPrimitive } from "radix-ui"

var rootCls = "bg-primary/20 relative h-2 w-full overflow-hidden rounded-full"
var indicatorCls = "bg-primary h-full w-full flex-1 transition-all"

export function progressImpl(props) {
  var { value, ...rest } = props
  return createElement(
    ProgressPrimitive.Root,
    { className: rootCls, "data-slot": "progress", value, ...rest },
    createElement(ProgressPrimitive.Indicator, {
      className: indicatorCls,
      "data-slot": "progress-indicator",
      style: { transform: "translateX(-" + (100 - (value || 0)) + "%)" }
    })
  )
}
