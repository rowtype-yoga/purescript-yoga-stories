import { createElement } from "react"

var cls = "border-input bg-transparent text-foreground focus-visible:border-ring focus-visible:ring-ring/50 h-9 w-full appearance-none rounded-md border py-1 pr-8 pl-3 text-base shadow-xs outline-none focus-visible:ring-[3px] disabled:cursor-not-allowed disabled:opacity-50 md:text-sm"

export function nativeSelectImpl(props) {
  var { children, ...rest } = props
  return createElement("div", { className: "relative", "data-slot": "native-select" },
    createElement("select", { className: cls, ...rest }, ...([].concat(children))),
    createElement("svg", { className: "pointer-events-none absolute right-2 top-1/2 size-4 -translate-y-1/2 opacity-50", xmlns: "http://www.w3.org/2000/svg", viewBox: "0 0 24 24", fill: "none", stroke: "currentColor", strokeWidth: "2" },
      createElement("path", { d: "m6 9 6 6 6-6" })
    )
  )
}
