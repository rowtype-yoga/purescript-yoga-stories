module ShadCN.AspectRatio where

import React.Basic (JSX)

foreign import aspectRatioImpl :: forall r. Record r -> JSX

aspectRatio :: { ratio :: Number, children :: Array JSX } -> JSX
aspectRatio props = aspectRatioImpl props
