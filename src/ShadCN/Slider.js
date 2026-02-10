import { createElement } from "react"
import { Slider as SliderPrimitive } from "radix-ui"

var rootCls = "relative flex w-full touch-none items-center select-none data-[disabled]:opacity-50"
var trackCls = "bg-muted relative grow overflow-hidden rounded-full h-1.5 w-full"
var rangeCls = "bg-primary absolute h-full"
var thumbCls = "border-primary ring-ring/50 block size-4 shrink-0 rounded-full border bg-white shadow-sm transition-[color,box-shadow] hover:ring-4 focus-visible:ring-4 focus-visible:outline-hidden disabled:pointer-events-none disabled:opacity-50"

export function sliderImpl(props) {
  var { ...rest } = props
  return createElement(
    SliderPrimitive.Root,
    { className: rootCls, "data-slot": "slider", ...rest },
    createElement(
      SliderPrimitive.Track,
      { className: trackCls, "data-slot": "slider-track" },
      createElement(SliderPrimitive.Range, { className: rangeCls, "data-slot": "slider-range" })
    ),
    createElement(SliderPrimitive.Thumb, { className: thumbCls, "data-slot": "slider-thumb" })
  )
}
