import { createElement } from "react"
import { RadioGroup as RadioGroupPrimitive } from "radix-ui"

var groupCls = "grid gap-3"
var itemCls = "border-input text-primary focus-visible:border-ring focus-visible:ring-ring/50 dark:bg-input/30 aspect-square size-4 shrink-0 rounded-full border shadow-xs transition-[color,box-shadow] outline-none focus-visible:ring-[3px] disabled:cursor-not-allowed disabled:opacity-50"

var circleSvg = createElement("svg", {
  xmlns: "http://www.w3.org/2000/svg",
  width: 10,
  height: 10,
  viewBox: "0 0 10 10",
  fill: "currentColor"
}, createElement("circle", { cx: 5, cy: 5, r: 5 }))

export function radioGroupImpl(props) {
  var { children, ...rest } = props
  return createElement(
    RadioGroupPrimitive.Root,
    { className: groupCls, "data-slot": "radio-group", ...rest },
    ...([].concat(children))
  )
}

export function radioGroupItemImpl(props) {
  var { ...rest } = props
  return createElement(
    RadioGroupPrimitive.Item,
    { className: itemCls, "data-slot": "radio-group-item", ...rest },
    createElement(
      RadioGroupPrimitive.Indicator,
      { className: "flex items-center justify-center", "data-slot": "radio-group-indicator" },
      circleSvg
    )
  )
}
