module ShadCN.Kbd where

import React.Basic (JSX)

foreign import kbdImpl :: forall r. Record r -> JSX
foreign import kbdGroupImpl :: forall r. Record r -> JSX

kbd :: { children :: Array JSX } -> JSX
kbd props = kbdImpl { children: props.children }

kbdGroup :: { children :: Array JSX } -> JSX
kbdGroup props = kbdGroupImpl { children: props.children }
