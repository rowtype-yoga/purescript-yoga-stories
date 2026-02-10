import { createElement } from "react"
import { AspectRatio as AspectRatioPrimitive } from "radix-ui"

export function aspectRatioImpl(props) {
  var { children, ...rest } = props
  return createElement(AspectRatioPrimitive.Root, { "data-slot": "aspect-ratio", ...rest }, ...([].concat(children)))
}
