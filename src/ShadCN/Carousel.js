import useEmblaCarousel from "embla-carousel-react"
import { createElement, createContext, useContext, useCallback, useEffect, useState } from "react"

var CarouselContext = createContext(null)

export function carouselProviderComp(props) {
  var { children, ...rest } = props
  var _a = useEmblaCarousel(rest.opts || {}), emblaRef = _a[0], emblaApi = _a[1]
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
  return createElement(CarouselContext.Provider, { value: { emblaRef: emblaRef, emblaApi: emblaApi, canPrev: canPrev, canNext: canNext } }, ...([].concat(children)))
}

export function carouselViewportComp(props) {
  var { children } = props
  var ctx = useContext(CarouselContext)
  return createElement("div", { className: "overflow-hidden", ref: ctx && ctx.emblaRef }, ...([].concat(children)))
}

export function carouselPrevComp(props) {
  var { children, ...rest } = props
  var ctx = useContext(CarouselContext)
  return createElement("button", { disabled: ctx && !ctx.canPrev, onClick: function() { ctx && ctx.emblaApi && ctx.emblaApi.scrollPrev() }, ...rest }, ...([].concat(children)))
}

export function carouselNextComp(props) {
  var { children, ...rest } = props
  var ctx = useContext(CarouselContext)
  return createElement("button", { disabled: ctx && !ctx.canNext, onClick: function() { ctx && ctx.emblaApi && ctx.emblaApi.scrollNext() }, ...rest }, ...([].concat(children)))
}
