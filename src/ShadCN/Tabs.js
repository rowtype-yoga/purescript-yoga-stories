import { createElement } from "react"
import { Tabs as TabsPrimitive } from "radix-ui"

var rootCls = "flex gap-2 flex-col"
var listCls = "bg-muted text-muted-foreground inline-flex w-fit items-center justify-center rounded-lg p-[3px] h-9"
var triggerCls = "text-foreground/60 hover:text-foreground dark:text-muted-foreground inline-flex h-[calc(100%-1px)] flex-1 items-center justify-center gap-1.5 rounded-md border border-transparent px-2 py-1 text-sm font-medium whitespace-nowrap transition-all focus-visible:ring-[3px] disabled:pointer-events-none disabled:opacity-50 data-[state=active]:bg-background data-[state=active]:text-foreground data-[state=active]:shadow-sm"
var contentCls = "flex-1 outline-none"

export function tabsImpl(props) {
  var { children, ...rest } = props
  return createElement(TabsPrimitive.Root, { className: rootCls, "data-slot": "tabs", ...rest }, ...([].concat(children)))
}

export function tabsListImpl(props) {
  var { children, ...rest } = props
  return createElement(TabsPrimitive.List, { className: listCls, "data-slot": "tabs-list", ...rest }, ...([].concat(children)))
}

export function tabsTriggerImpl(props) {
  var { children, ...rest } = props
  return createElement(TabsPrimitive.Trigger, { className: triggerCls, "data-slot": "tabs-trigger", ...rest }, ...([].concat(children)))
}

export function tabsContentImpl(props) {
  var { children, ...rest } = props
  return createElement(TabsPrimitive.Content, { className: contentCls, "data-slot": "tabs-content", ...rest }, ...([].concat(children)))
}
