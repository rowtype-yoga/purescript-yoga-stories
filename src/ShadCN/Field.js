import { createElement } from "react"

var fieldSetCls = "flex flex-col gap-6"
var fieldGroupCls = "flex w-full flex-col gap-7"
var fieldCls = "group/field flex w-full gap-3 flex-col"
var fieldContentCls = "flex flex-1 flex-col gap-1.5 leading-snug"
var fieldLabelCls = "flex w-fit items-center gap-2 text-sm leading-snug font-medium"
var fieldDescriptionCls = "text-muted-foreground text-sm leading-normal font-normal"
var fieldErrorCls = "text-destructive text-sm font-normal"

export function fieldSetImpl(props) {
  var { children, ...rest } = props
  return createElement("fieldset", { className: fieldSetCls, "data-slot": "field-set", ...rest }, ...([].concat(children)))
}
export function fieldGroupImpl(props) {
  var { children, ...rest } = props
  return createElement("div", { className: fieldGroupCls, "data-slot": "field-group", ...rest }, ...([].concat(children)))
}
export function fieldImpl(props) {
  var { children, ...rest } = props
  return createElement("div", { className: fieldCls, role: "group", "data-slot": "field", ...rest }, ...([].concat(children)))
}
export function fieldContentImpl(props) {
  var { children, ...rest } = props
  return createElement("div", { className: fieldContentCls, "data-slot": "field-content", ...rest }, ...([].concat(children)))
}
export function fieldLabelImpl(props) {
  var { children, ...rest } = props
  return createElement("div", { className: fieldLabelCls, "data-slot": "field-label", ...rest }, ...([].concat(children)))
}
export function fieldDescriptionImpl(props) {
  var { children, ...rest } = props
  return createElement("p", { className: fieldDescriptionCls, "data-slot": "field-description", ...rest }, ...([].concat(children)))
}
export function fieldErrorImpl(props) {
  var { children, ...rest } = props
  return createElement("div", { className: fieldErrorCls, role: "alert", "data-slot": "field-error", ...rest }, ...([].concat(children)))
}
