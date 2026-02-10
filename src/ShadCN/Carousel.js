import useEmblaCarousel from "embla-carousel-react"
import { createElement, createContext, useContext, useCallback, useEffect, useState } from "react"

var Ctx = createContext(null)

export function carouselProviderComp(props) {
  var { children } = props
  var _a = useEmblaCarousel({}), ref = _a[0], api = _a[1]
  var _b = useState(false), canPrev = _b[0], setCanPrev = _b[1]
  var _c = useState(false), canNext = _c[0], setCanNext = _c[1]
  var onSelect = useCallback(function(a) { setCanPrev(a.canScrollPrev()); setCanNext(a.canScrollNext()) }, [])
  useEffect(function() {
    if (!api) return
    onSelect(api)
    api.on("reInit", onSelect)
    api.on("select", onSelect)
  }, [api, onSelect])
  return createElement(Ctx.Provider, { value: { ref: ref, canPrev: canPrev, canNext: canNext, prev: function() { api && api.scrollPrev() }, next: function() { api && api.scrollNext() } } }, ...([].concat(children)))
}

export function carouselViewportComp(props) {
  var { children } = props
  var ctx = useContext(Ctx)
  return createElement("div", { className: "overflow-hidden", ref: ctx && ctx.ref }, ...([].concat(children)))
}

export function carouselPrevComp(props) {
  var { children, ...rest } = props
  var ctx = useContext(Ctx)
  return createElement("button", { disabled: ctx && !ctx.canPrev, onClick: function() { ctx && ctx.prev() }, ...rest }, ...([].concat(children)))
}

export function carouselNextComp(props) {
  var { children, ...rest } = props
  var ctx = useContext(Ctx)
  return createElement("button", { disabled: ctx && !ctx.canNext, onClick: function() { ctx && ctx.next() }, ...rest }, ...([].concat(children)))
}
