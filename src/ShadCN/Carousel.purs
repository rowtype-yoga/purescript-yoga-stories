module ShadCN.Carousel where

import React.Basic (JSX, ReactComponent)
import Yoga.React.DOM.HTML (div)
import Yoga.React.DOM.Internal (class IsJSX, createElement)

foreign import carouselProviderComp :: forall r. ReactComponent { | r }
foreign import carouselViewportComp :: forall r. ReactComponent { | r }
foreign import carouselPrevComp :: forall r. ReactComponent { | r }
foreign import carouselNextComp :: forall r. ReactComponent { | r }

carousel :: forall kids. IsJSX kids => kids -> JSX
carousel kids = createElement carouselProviderComp {}
  [ div { className: "relative", role: "region" }
    [ carouselViewport [ div { className: "flex" } kids ] ]
  ]

carouselViewport :: forall kids. IsJSX kids => kids -> JSX
carouselViewport = createElement carouselViewportComp {}

carouselItem :: forall kids. IsJSX kids => kids -> JSX
carouselItem = div { className: "min-w-0 shrink-0 grow-0 basis-full", role: "group" }

carouselPrevious :: forall kids. IsJSX kids => kids -> JSX
carouselPrevious = createElement carouselPrevComp { className: "absolute z-10 flex size-8 items-center justify-center rounded-full border bg-background shadow-sm disabled:opacity-50 -left-12 top-1/2 -translate-y-1/2" }

carouselNext :: forall kids. IsJSX kids => kids -> JSX
carouselNext = createElement carouselNextComp { className: "absolute z-10 flex size-8 items-center justify-center rounded-full border bg-background shadow-sm disabled:opacity-50 -right-12 top-1/2 -translate-y-1/2" }
