module ShadCN.Avatar where

import React.Basic (JSX)

foreign import avatarImpl :: forall r. Record r -> JSX
foreign import avatarImageImpl :: forall r. Record r -> JSX
foreign import avatarFallbackImpl :: forall r. Record r -> JSX

avatar :: { children :: Array JSX } -> JSX
avatar props = avatarImpl props

avatarImage :: { src :: String, alt :: String } -> JSX
avatarImage props = avatarImageImpl props

avatarFallback :: { children :: Array JSX } -> JSX
avatarFallback props = avatarFallbackImpl props
