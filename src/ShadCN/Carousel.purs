module ShadCN.Carousel where

import React.Basic (JSX)

foreign import carouselImpl :: forall r. Record r -> JSX
foreign import carouselItemImpl :: forall r. Record r -> JSX
foreign import carouselPreviousImpl :: forall r. Record r -> JSX
foreign import carouselNextImpl :: forall r. Record r -> JSX

carousel :: Array JSX -> JSX
carousel kids = carouselImpl { children: kids }

carouselItem :: Array JSX -> JSX
carouselItem kids = carouselItemImpl { children: kids }

carouselPrevious :: {} -> JSX
carouselPrevious props = carouselPreviousImpl props

carouselNext :: {} -> JSX
carouselNext props = carouselNextImpl props
