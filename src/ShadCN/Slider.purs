module ShadCN.Slider where

import React.Basic (JSX)

foreign import sliderImpl :: forall r. Record r -> JSX

slider :: {} -> JSX
slider props = sliderImpl props
