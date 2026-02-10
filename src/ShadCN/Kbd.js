import { createElement } from "react"

var kbdCls = "bg-muted text-muted-foreground pointer-events-none inline-flex h-5 w-fit min-w-5 items-center justify-center gap-1 rounded-sm px-1 font-sans text-xs font-medium select-none"
var kbdGroupCls = "inline-flex items-center gap-1"

export function kbdImpl(props) {
  var { children, ...rest } = props
  return createElement("kbd", { className: kbdCls, ...rest }, ...children)
}

export function kbdGroupImpl(props) {
  var { children, ...rest } = props
  return createElement("div", { className: kbdGroupCls, ...rest }, ...children)
}
