module ShadCN.Carousel where

import React.Basic (JSX)

foreign import carouselImpl :: forall r. Record r -> JSX
foreign import carouselItemImpl :: forall r. Record r -> JSX
foreign import carouselPreviousImpl :: forall r. Record r -> JSX
foreign import carouselNextImpl :: forall r. Record r -> JSX

carousel :: { children :: Array JSX } -> JSX
carousel props = carouselImpl props

carouselItem :: { children :: Array JSX } -> JSX
carouselItem props = carouselItemImpl props

carouselPrevious :: {} -> JSX
carouselPrevious props = carouselPreviousImpl props

carouselNext :: {} -> JSX
carouselNext props = carouselNextImpl props
