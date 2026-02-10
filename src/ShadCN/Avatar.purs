module ShadCN.Avatar where

import React.Basic (JSX)

foreign import avatarImpl :: forall r. Record r -> JSX
foreign import avatarImageImpl :: forall r. Record r -> JSX
foreign import avatarFallbackImpl :: forall r. Record r -> JSX

avatar :: Array JSX -> JSX
avatar kids = avatarImpl { children: kids }

avatarImage :: { src :: String, alt :: String } -> JSX
avatarImage props = avatarImageImpl props

avatarFallback :: Array JSX -> JSX
avatarFallback kids = avatarFallbackImpl { children: kids }
