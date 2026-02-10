import { createElement } from "react"
import { Collapsible as CollapsiblePrimitive } from "radix-ui"

export function collapsibleImpl(props) {
  var { children, ...rest } = props
  return createElement(CollapsiblePrimitive.Root, { "data-slot": "collapsible", ...rest }, ...([].concat(children)))
}

export function collapsibleTriggerImpl(props) {
  var { children, ...rest } = props
  return createElement(CollapsiblePrimitive.Trigger, { "data-slot": "collapsible-trigger", ...rest }, ...([].concat(children)))
}

export function collapsibleContentImpl(props) {
  var { children, ...rest } = props
  return createElement(CollapsiblePrimitive.Content, { "data-slot": "collapsible-content", ...rest }, ...([].concat(children)))
}
