module ShadCN.Toggle where

import React.Basic (JSX)

foreign import toggleImpl :: forall r. Record r -> JSX

toggle :: { variant :: String, size :: String, children :: Array JSX } -> JSX
toggle props = toggleImpl props
