module ShadCN.Toggle where

import React.Basic (JSX)

foreign import toggleImpl :: forall r. Record r -> JSX

toggle :: { variant :: String, size :: String } -> Array JSX -> JSX
toggle props kids = toggleImpl { variant: props.variant, size: props.size, children: kids }
