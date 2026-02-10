import { createElement } from "react"
import { Panel, PanelGroup, PanelResizeHandle } from "react-resizable-panels"

var groupCls = "flex h-full w-full data-[panel-group-direction=vertical]:flex-col"
var handleCls = "bg-border relative flex w-px items-center justify-center after:absolute after:inset-y-0 after:left-1/2 after:w-1 after:-translate-x-1/2 focus-visible:outline-none focus-visible:ring-1 focus-visible:ring-ring focus-visible:ring-offset-1 data-[panel-group-direction=vertical]:h-px data-[panel-group-direction=vertical]:w-full data-[panel-group-direction=vertical]:after:left-0 data-[panel-group-direction=vertical]:after:h-1 data-[panel-group-direction=vertical]:after:w-full data-[panel-group-direction=vertical]:after:-translate-y-1/2 data-[panel-group-direction=vertical]:after:translate-x-0"

export function resizablePanelGroupImpl(props) {
  var { children, ...rest } = props
  return createElement(PanelGroup, { className: groupCls, "data-slot": "resizable-panel-group", ...rest }, ...([].concat(children)))
}
export function resizablePanelImpl(props) {
  var { children, ...rest } = props
  return createElement(Panel, { "data-slot": "resizable-panel", ...rest }, ...([].concat(children)))
}
export function resizableHandleImpl(props) {
  return createElement(PanelResizeHandle, { className: handleCls, "data-slot": "resizable-handle", ...props })
}
