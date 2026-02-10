import { createElement } from "react"
import { Separator as SeparatorPrimitive } from "radix-ui"

export function separatorImpl(props) {
  var { orientation = "horizontal", decorative = true, ...rest } = props
  var cls = "bg-border shrink-0" + (orientation === "vertical" ? " h-full w-px" : " h-px w-full")
  return createElement(SeparatorPrimitive.Root, { orientation, decorative, className: cls, "data-slot": "separator", ...rest })
}
