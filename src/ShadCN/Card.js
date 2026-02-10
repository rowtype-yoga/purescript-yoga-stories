import { createElement } from "react"

var cardCls = "bg-card text-card-foreground flex flex-col gap-6 rounded-xl border py-6 shadow-sm"
var headerCls = "@container/card-header grid auto-rows-min grid-rows-[auto_auto] items-start gap-2 px-6 has-data-[slot=card-action]:grid-cols-[1fr_auto] [.border-b]:pb-6"
var titleCls = "leading-none font-semibold"
var descriptionCls = "text-muted-foreground text-sm"
var contentCls = "px-6"
var footerCls = "flex items-center px-6 [.border-t]:pt-6"

export function cardImpl(props) {
  var { children, ...rest } = props
  return createElement("div", { className: cardCls, ...rest }, ...children)
}

export function cardHeaderImpl(props) {
  var { children, ...rest } = props
  return createElement("div", { className: headerCls, ...rest }, ...children)
}

export function cardTitleImpl(props) {
  var { children, ...rest } = props
  return createElement("div", { className: titleCls, ...rest }, ...children)
}

export function cardDescriptionImpl(props) {
  var { children, ...rest } = props
  return createElement("div", { className: descriptionCls, ...rest }, ...children)
}

export function cardContentImpl(props) {
  var { children, ...rest } = props
  return createElement("div", { className: contentCls, ...rest }, ...children)
}

export function cardFooterImpl(props) {
  var { children, ...rest } = props
  return createElement("div", { className: footerCls, ...rest }, ...children)
}
