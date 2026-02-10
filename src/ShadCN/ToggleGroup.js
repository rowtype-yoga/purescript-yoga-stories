import { createElement } from "react"
import { ToggleGroup as P } from "radix-ui"

var groupCls = "flex w-fit items-center gap-0 rounded-md"
var itemBase = "inline-flex items-center justify-center gap-2 rounded-none text-sm font-medium hover:bg-muted hover:text-muted-foreground disabled:pointer-events-none disabled:opacity-50 data-[state=on]:bg-accent data-[state=on]:text-accent-foreground outline-none transition-[color,box-shadow] whitespace-nowrap first:rounded-l-md last:rounded-r-md h-9 px-3 min-w-9"

export function toggleGroupImpl(props) {
  var { children, ...rest } = props
  return createElement(P.Root, { className: groupCls, "data-slot": "toggle-group", ...rest }, ...([].concat(children)))
}
export function toggleGroupItemImpl(props) {
  var { children, ...rest } = props
  return createElement(P.Item, { className: itemBase, "data-slot": "toggle-group-item", ...rest }, ...([].concat(children)))
}
