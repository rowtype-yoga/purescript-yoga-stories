import { createElement } from "react"
import { Checkbox as CheckboxPrimitive } from "radix-ui"

var rootCls = "peer border-input dark:bg-input/30 data-[state=checked]:bg-primary data-[state=checked]:text-primary-foreground dark:data-[state=checked]:bg-primary data-[state=checked]:border-primary focus-visible:border-ring focus-visible:ring-ring/50 size-4 shrink-0 rounded-[4px] border shadow-xs transition-shadow outline-none focus-visible:ring-[3px] disabled:cursor-not-allowed disabled:opacity-50"

var checkSvg = createElement("svg", {
  xmlns: "http://www.w3.org/2000/svg",
  width: 16,
  height: 16,
  viewBox: "0 0 24 24",
  fill: "none",
  stroke: "currentColor",
  strokeWidth: 3,
  strokeLinecap: "round",
  strokeLinejoin: "round"
}, createElement("path", { d: "M20 6 9 17l-5-5" }))

export function checkboxImpl(props) {
  var { ...rest } = props
  return createElement(
    CheckboxPrimitive.Root,
    { className: rootCls, "data-slot": "checkbox", ...rest },
    createElement(
      CheckboxPrimitive.Indicator,
      { className: "flex items-center justify-center text-current", "data-slot": "checkbox-indicator" },
      checkSvg
    )
  )
}
