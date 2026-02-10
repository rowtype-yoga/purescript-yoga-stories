import { createElement, createContext, useContext, useState } from "react"

var SidebarContext = createContext({ open: true, setOpen: function(){} })

export function sidebarProviderComp(props) {
  var { children, ...rest } = props
  var _s = useState(true), open = _s[0], setOpen = _s[1]
  return createElement(SidebarContext.Provider, { value: { open: open, setOpen: setOpen } }, ...([].concat(children)))
}

export function sidebarComp(props) {
  var { children, ...rest } = props
  var ctx = useContext(SidebarContext)
  return createElement("div", { "data-state": ctx.open ? "expanded" : "collapsed", ...rest }, ...([].concat(children)))
}

export function sidebarTriggerComp(props) {
  var { children, ...rest } = props
  var ctx = useContext(SidebarContext)
  return createElement("button", { onClick: function() { ctx.setOpen(!ctx.open) }, ...rest }, ...([].concat(children)))
}
