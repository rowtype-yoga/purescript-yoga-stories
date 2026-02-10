module ShadCN.AspectRatio where

import React.Basic (JSX)

foreign import aspectRatioImpl :: forall r. Record r -> JSX

aspectRatio :: Number -> Array JSX -> JSX
aspectRatio ratio kids = aspectRatioImpl { ratio, children: kids }
