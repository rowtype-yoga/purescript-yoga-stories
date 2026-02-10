import { createElement } from "react"

var containerCls = "flex aspect-video justify-center text-xs"

export function chartContainerImpl(props) {
  var { children, ...rest } = props
  return createElement("div", { className: containerCls, "data-slot": "chart", ...rest }, ...([].concat(children)))
}
