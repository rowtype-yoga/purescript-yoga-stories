import { createElement } from "react"

var wrapperCls = "relative w-full overflow-x-auto"
var tableCls = "w-full caption-bottom text-sm"
var headerCls = "[&_tr]:border-b"
var bodyCls = "[&_tr:last-child]:border-0"
var footerCls = "bg-muted/50 border-t font-medium [&>tr]:last:border-b-0"
var rowCls = "hover:bg-muted/50 data-[state=selected]:bg-muted border-b transition-colors"
var headCls = "text-foreground h-10 px-2 text-left align-middle font-medium whitespace-nowrap [&:has([role=checkbox])]:pr-0 [&>[role=checkbox]]:translate-y-[2px]"
var cellCls = "p-2 align-middle whitespace-nowrap [&:has([role=checkbox])]:pr-0 [&>[role=checkbox]]:translate-y-[2px]"
var captionCls = "text-muted-foreground mt-4 text-sm"

export function tableImpl(props) {
  var { children, ...rest } = props
  return createElement("div", { className: wrapperCls },
    createElement("table", { className: tableCls, ...rest }, ...children)
  )
}

export function tableHeaderImpl(props) {
  var { children, ...rest } = props
  return createElement("thead", { className: headerCls, ...rest }, ...children)
}

export function tableBodyImpl(props) {
  var { children, ...rest } = props
  return createElement("tbody", { className: bodyCls, ...rest }, ...children)
}

export function tableFooterImpl(props) {
  var { children, ...rest } = props
  return createElement("tfoot", { className: footerCls, ...rest }, ...children)
}

export function tableRowImpl(props) {
  var { children, ...rest } = props
  return createElement("tr", { className: rowCls, ...rest }, ...children)
}

export function tableHeadImpl(props) {
  var { children, ...rest } = props
  return createElement("th", { className: headCls, ...rest }, ...children)
}

export function tableCellImpl(props) {
  var { children, ...rest } = props
  return createElement("td", { className: cellCls, ...rest }, ...children)
}

export function tableCaptionImpl(props) {
  var { children, ...rest } = props
  return createElement("caption", { className: captionCls, ...rest }, ...children)
}
