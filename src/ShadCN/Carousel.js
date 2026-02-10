import { createElement, createContext, useContext, useCallback, useEffect, useState } from "react"
import useEmblaCarousel from "embla-carousel-react"

var CarouselContext = createContext(null)

var rootCls = "relative"
var contentCls = "overflow-hidden"
var innerCls = "flex"
var itemCls = "min-w-0 shrink-0 grow-0 basis-full"
var btnCls = "absolute z-10 flex size-8 items-center justify-center rounded-full border bg-background shadow-sm disabled:opacity-50"
var prevCls = btnCls + " -left-12 top-1/2 -translate-y-1/2"
var nextCls = btnCls + " -right-12 top-1/2 -translate-y-1/2"

export function carouselImpl(props) {
  var { children, opts, ...rest } = props
  var _a = useEmblaCarousel(opts || {}), emblaRef = _a[0], emblaApi = _a[1]
  var _b = useState(false), canPrev = _b[0], setCanPrev = _b[1]
  var _c = useState(false), canNext = _c[0], setCanNext = _c[1]
  var onSelect = useCallback(function(api) {
    setCanPrev(api.canScrollPrev())
    setCanNext(api.canScrollNext())
  }, [])
  useEffect(function() {
    if (!emblaApi) return
    onSelect(emblaApi)
    emblaApi.on("reInit", onSelect)
    emblaApi.on("select", onSelect)
  }, [emblaApi, onSelect])
  return createElement(CarouselContext.Provider, { value: { emblaApi: emblaApi, canPrev: canPrev, canNext: canNext } },
    createElement("div", { className: rootCls, role: "region", "aria-roledescription": "carousel", "data-slot": "carousel", ...rest },
      createElement("div", { className: contentCls, ref: emblaRef, "data-slot": "carousel-content" },
        createElement("div", { className: innerCls }, ...([].concat(children)))
      )
    )
  )
}
export function carouselItemImpl(props) {
  var { children, ...rest } = props
  return createElement("div", { className: itemCls, role: "group", "aria-roledescription": "slide", "data-slot": "carousel-item", ...rest }, ...([].concat(children)))
}
export function carouselPreviousImpl(props) {
  var ctx = useContext(CarouselContext)
  return createElement("button", { className: prevCls, "data-slot": "carousel-previous", disabled: ctx && !ctx.canPrev, onClick: function() { ctx && ctx.emblaApi && ctx.emblaApi.scrollPrev() }, ...props },
    createElement("svg", { xmlns: "http://www.w3.org/2000/svg", width: "16", height: "16", viewBox: "0 0 24 24", fill: "none", stroke: "currentColor", strokeWidth: "2" }, createElement("path", { d: "m15 18-6-6 6-6" }))
  )
}
export function carouselNextImpl(props) {
  var ctx = useContext(CarouselContext)
  return createElement("button", { className: nextCls, "data-slot": "carousel-next", disabled: ctx && !ctx.canNext, onClick: function() { ctx && ctx.emblaApi && ctx.emblaApi.scrollNext() }, ...props },
    createElement("svg", { xmlns: "http://www.w3.org/2000/svg", width: "16", height: "16", viewBox: "0 0 24 24", fill: "none", stroke: "currentColor", strokeWidth: "2" }, createElement("path", { d: "m9 18 6-6-6-6" }))
  )
}
