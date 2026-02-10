import { createElement } from "react"
import { Toggle as TogglePrimitive } from "radix-ui"

var base = "inline-flex items-center justify-center gap-2 rounded-md text-sm font-medium hover:bg-muted hover:text-muted-foreground disabled:pointer-events-none disabled:opacity-50 data-[state=on]:bg-accent data-[state=on]:text-accent-foreground focus-visible:ring-ring/50 focus-visible:ring-[3px] outline-none transition-[color,box-shadow] whitespace-nowrap"

var variants = {
  default: "bg-transparent",
  outline: "border border-input bg-transparent shadow-xs hover:bg-accent hover:text-accent-foreground"
}

var sizes = {
  default: "h-9 px-2 min-w-9",
  sm: "h-8 px-1.5 min-w-8",
  lg: "h-10 px-2.5 min-w-10"
}

export function toggleImpl(props) {
  var { variant = "default", size = "default", children, ...rest } = props
  var cls = base + " " + (variants[variant] || variants.default) + " " + (sizes[size] || sizes.default)
  return createElement(TogglePrimitive.Root, { className: cls, "data-slot": "toggle", ...rest }, ...([].concat(children)))
}
