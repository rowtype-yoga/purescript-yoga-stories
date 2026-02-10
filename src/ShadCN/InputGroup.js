import { createElement } from "react"

var groupCls = "border-input dark:bg-input/30 relative flex w-full items-center rounded-md border shadow-xs transition-[color,box-shadow] outline-none h-9 min-w-0"

export function inputGroupImpl(props) {
  var { children, ...rest } = props
  return createElement("div", { className: groupCls, role: "group", "data-slot": "input-group", ...rest }, ...([].concat(children)))
}
export function inputGroupAddonImpl(props) {
  var { children, align = "inline-start", ...rest } = props
  var cls = "text-muted-foreground flex h-auto items-center justify-center gap-2 py-1.5 text-sm font-medium select-none"
  if (align === "inline-start") cls += " order-first pl-3"
  else cls += " order-last pr-3"
  return createElement("div", { className: cls, "data-slot": "input-group-addon", "data-align": align, ...rest }, ...([].concat(children)))
}
export function inputGroupInputImpl(props) {
  var inputCls = "flex-1 rounded-none border-0 bg-transparent shadow-none focus-visible:ring-0 dark:bg-transparent h-9 w-full min-w-0 px-3 py-1 text-base outline-none md:text-sm"
  return createElement("input", { className: inputCls, "data-slot": "input-group-control", ...props })
}
export function inputGroupTextImpl(props) {
  var { children, ...rest } = props
  return createElement("span", { className: "text-muted-foreground flex items-center gap-2 text-sm", ...rest }, ...([].concat(children)))
}
