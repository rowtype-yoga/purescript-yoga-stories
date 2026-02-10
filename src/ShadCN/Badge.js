import { createElement } from "react"

var base = "inline-flex items-center justify-center rounded-full border border-transparent px-2 py-0.5 text-xs font-medium w-fit whitespace-nowrap shrink-0 gap-1 transition-[color,box-shadow] overflow-hidden"

var variants = {
  default: "bg-primary text-primary-foreground",
  secondary: "bg-secondary text-secondary-foreground",
  destructive: "bg-destructive text-white",
  outline: "border-border text-foreground",
}

export function badgeImpl(props) {
  var { variant, children, ...rest } = props
  var cls = base + " " + (variants[variant] || variants.default)
  return createElement("span", { className: cls, ...rest }, ...children)
}
