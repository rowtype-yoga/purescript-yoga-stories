import { createElement } from "react"

var base = "relative w-full rounded-lg border px-4 py-3 text-sm grid has-[>svg]:grid-cols-[calc(var(--spacing)*4)_1fr] grid-cols-[0_1fr] has-[>svg]:gap-x-3 gap-y-0.5 items-start [&>svg]:size-4 [&>svg]:translate-y-0.5 [&>svg]:text-current"

var variants = {
  default: "bg-card text-card-foreground",
  destructive: "text-destructive bg-card [&>svg]:text-current",
}

var titleCls = "col-start-2 line-clamp-1 min-h-4 font-medium tracking-tight"
var descriptionCls = "text-muted-foreground col-start-2 grid justify-items-start gap-1 text-sm [&_p]:leading-relaxed"

export function alertImpl(props) {
  var { variant, children, ...rest } = props
  var cls = base + " " + (variants[variant] || variants.default)
  return createElement("div", { className: cls, role: "alert", ...rest }, ...children)
}

export function alertTitleImpl(props) {
  var { children, ...rest } = props
  return createElement("div", { className: titleCls, ...rest }, ...children)
}

export function alertDescriptionImpl(props) {
  var { children, ...rest } = props
  return createElement("div", { className: descriptionCls, ...rest }, ...children)
}
