module ShadCN.InputGroup where

import React.Basic (JSX)

foreign import inputGroupImpl :: forall r. Record r -> JSX
foreign import inputGroupAddonImpl :: forall r. Record r -> JSX
foreign import inputGroupInputImpl :: forall r. Record r -> JSX
foreign import inputGroupTextImpl :: forall r. Record r -> JSX

inputGroup :: { children :: Array JSX } -> JSX
inputGroup props = inputGroupImpl props

inputGroupAddon :: { children :: Array JSX } -> JSX
inputGroupAddon props = inputGroupAddonImpl props

inputGroupInput :: forall r. Record r -> JSX
inputGroupInput props = inputGroupInputImpl props

inputGroupText :: { children :: Array JSX } -> JSX
inputGroupText props = inputGroupTextImpl props
