import { createElement } from "react"

var itemCls = "group/item flex items-center border border-transparent text-sm rounded-md transition-colors flex-wrap p-4 gap-4"
var mediaCls = "flex shrink-0 items-center justify-center gap-2"
var contentCls = "flex flex-1 flex-col gap-1"
var titleCls = "flex w-fit items-center gap-2 text-sm leading-snug font-medium"
var descriptionCls = "text-muted-foreground line-clamp-2 text-sm leading-normal font-normal text-balance"
var actionsCls = "flex items-center gap-2"
var groupCls = "flex flex-col"

export function itemImpl(props) {
  var { children, ...rest } = props
  return createElement("div", { className: itemCls, "data-slot": "item", ...rest }, ...([].concat(children)))
}
export function itemGroupImpl(props) {
  var { children, ...rest } = props
  return createElement("div", { className: groupCls, role: "list", "data-slot": "item-group", ...rest }, ...([].concat(children)))
}
export function itemMediaImpl(props) {
  var { children, ...rest } = props
  return createElement("div", { className: mediaCls, "data-slot": "item-media", ...rest }, ...([].concat(children)))
}
export function itemContentImpl(props) {
  var { children, ...rest } = props
  return createElement("div", { className: contentCls, "data-slot": "item-content", ...rest }, ...([].concat(children)))
}
export function itemTitleImpl(props) {
  var { children, ...rest } = props
  return createElement("div", { className: titleCls, "data-slot": "item-title", ...rest }, ...([].concat(children)))
}
export function itemDescriptionImpl(props) {
  var { children, ...rest } = props
  return createElement("p", { className: descriptionCls, "data-slot": "item-description", ...rest }, ...([].concat(children)))
}
export function itemActionsImpl(props) {
  var { children, ...rest } = props
  return createElement("div", { className: actionsCls, "data-slot": "item-actions", ...rest }, ...([].concat(children)))
}
