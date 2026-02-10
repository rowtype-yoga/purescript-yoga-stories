module ShadCN.Label where

import React.Basic (JSX)

foreign import labelImpl :: forall r. Record r -> JSX

label :: { children :: Array JSX } -> JSX
label props = labelImpl props
