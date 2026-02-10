import { createElement } from "react"
import { Select as SelectPrimitive } from "radix-ui"

var triggerCls = "border-input data-[placeholder]:text-muted-foreground focus-visible:border-ring focus-visible:ring-ring/50 dark:bg-input/30 flex w-fit items-center justify-between gap-2 rounded-md border bg-transparent px-3 py-2 text-sm whitespace-nowrap shadow-xs transition-[color,box-shadow] outline-none focus-visible:ring-[3px] disabled:cursor-not-allowed disabled:opacity-50 h-9"
var contentCls = "bg-popover text-popover-foreground data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 data-[state=closed]:zoom-out-95 data-[state=open]:zoom-in-95 relative z-50 min-w-[8rem] overflow-hidden rounded-md border shadow-md"
var itemCls = "focus:bg-accent focus:text-accent-foreground relative flex w-full cursor-default items-center gap-2 rounded-sm py-1.5 pr-8 pl-2 text-sm outline-hidden select-none data-[disabled]:pointer-events-none data-[disabled]:opacity-50"
var labelCls = "text-muted-foreground px-2 py-1.5 text-xs"
var separatorCls = "bg-border pointer-events-none -mx-1 my-1 h-px"

var chevronSvg = createElement("svg", {
  xmlns: "http://www.w3.org/2000/svg",
  width: 16,
  height: 16,
  viewBox: "0 0 24 24",
  fill: "none",
  stroke: "currentColor",
  strokeWidth: 2,
  strokeLinecap: "round",
  strokeLinejoin: "round",
  className: "size-4 opacity-50"
}, createElement("path", { d: "m6 9 6 6 6-6" }))

var checkSvg = createElement("svg", {
  xmlns: "http://www.w3.org/2000/svg",
  width: 16,
  height: 16,
  viewBox: "0 0 24 24",
  fill: "none",
  stroke: "currentColor",
  strokeWidth: 2,
  strokeLinecap: "round",
  strokeLinejoin: "round"
}, createElement("path", { d: "M20 6 9 17l-5-5" }))

export function selectImpl(props) {
  var { children, ...rest } = props
  return createElement(SelectPrimitive.Root, { "data-slot": "select", ...rest }, ...([].concat(children)))
}

export function selectTriggerImpl(props) {
  var { children, ...rest } = props
  return createElement(
    SelectPrimitive.Trigger,
    { className: triggerCls, "data-slot": "select-trigger", ...rest },
    ...([].concat(children)),
    createElement(SelectPrimitive.Icon, { asChild: true }, chevronSvg)
  )
}

export function selectContentImpl(props) {
  var { children, position = "popper", ...rest } = props
  return createElement(
    SelectPrimitive.Portal,
    {},
    createElement(
      SelectPrimitive.Content,
      { className: contentCls + (position === "popper" ? " data-[side=bottom]:translate-y-1 data-[side=left]:-translate-x-1 data-[side=right]:translate-x-1 data-[side=top]:-translate-y-1" : ""), "data-slot": "select-content", position, ...rest },
      createElement(
        SelectPrimitive.Viewport,
        { className: "p-1" + (position === "popper" ? " h-[var(--radix-select-trigger-height)] w-full min-w-[var(--radix-select-trigger-width)]" : "") },
        ...([].concat(children))
      )
    )
  )
}

export function selectItemImpl(props) {
  var { children, ...rest } = props
  return createElement(
    SelectPrimitive.Item,
    { className: itemCls, "data-slot": "select-item", ...rest },
    createElement(
      "span",
      { className: "absolute right-2 flex size-3.5 items-center justify-center" },
      createElement(SelectPrimitive.ItemIndicator, {}, checkSvg)
    ),
    createElement(SelectPrimitive.ItemText, {}, ...([].concat(children)))
  )
}

export function selectValueImpl(props) {
  return createElement(SelectPrimitive.Value, { "data-slot": "select-value", ...props })
}

export function selectGroupImpl(props) {
  var { children, ...rest } = props
  return createElement(SelectPrimitive.Group, { "data-slot": "select-group", ...rest }, ...([].concat(children)))
}

export function selectLabelImpl(props) {
  var { children, ...rest } = props
  return createElement(SelectPrimitive.Label, { className: labelCls, "data-slot": "select-label", ...rest }, ...([].concat(children)))
}

export function selectSeparatorImpl(props) {
  return createElement(SelectPrimitive.Separator, { className: separatorCls, "data-slot": "select-separator", ...props })
}
