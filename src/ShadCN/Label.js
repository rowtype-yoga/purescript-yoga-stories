import { createElement } from "react"
import { Label as LabelPrimitive } from "radix-ui"

var cls = "flex items-center gap-2 text-sm leading-none font-medium select-none group-data-[disabled=true]:pointer-events-none group-data-[disabled=true]:opacity-50 peer-disabled:cursor-not-allowed peer-disabled:opacity-50"

export function labelImpl(props) {
  var { children, ...rest } = props
  return createElement(LabelPrimitive.Root, { className: cls, "data-slot": "label", ...rest }, ...([].concat(children)))
}
