import { createElement } from "react"
import { ScrollArea as ScrollAreaPrimitive } from "radix-ui"

var rootCls = "relative"
var viewportCls = "size-full rounded-[inherit]"
var thumbCls = "bg-border relative flex-1 rounded-full"

function scrollbarCls(orientation) {
  var base = "flex touch-none p-px transition-colors select-none"
  if (orientation === "horizontal") {
    return base + " h-2.5 flex-col border-t border-t-transparent"
  }
  return base + " h-full w-2.5 border-l border-l-transparent"
}

export function scrollAreaImpl(props) {
  var { children, ...rest } = props
  return createElement(
    ScrollAreaPrimitive.Root,
    { className: rootCls, "data-slot": "scroll-area", ...rest },
    createElement(
      ScrollAreaPrimitive.Viewport,
      { className: viewportCls, "data-slot": "scroll-area-viewport" },
      ...([].concat(children))
    ),
    createElement(
      ScrollAreaPrimitive.Scrollbar,
      { className: scrollbarCls("vertical"), orientation: "vertical", "data-slot": "scroll-area-scrollbar" },
      createElement(ScrollAreaPrimitive.Thumb, { className: thumbCls, "data-slot": "scroll-area-thumb" })
    ),
    createElement(ScrollAreaPrimitive.Corner, {})
  )
}

export function scrollBarImpl(props) {
  var { orientation = "vertical", ...rest } = props
  return createElement(
    ScrollAreaPrimitive.Scrollbar,
    { className: scrollbarCls(orientation), orientation, "data-slot": "scroll-area-scrollbar", ...rest },
    createElement(ScrollAreaPrimitive.Thumb, { className: thumbCls, "data-slot": "scroll-area-thumb" })
  )
}
