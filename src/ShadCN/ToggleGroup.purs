module ShadCN.ToggleGroup where

import React.Basic (JSX)

foreign import toggleGroupImpl :: forall r. Record r -> JSX
foreign import toggleGroupItemImpl :: forall r. Record r -> JSX

toggleGroup :: { type :: String, children :: Array JSX } -> JSX
toggleGroup props = toggleGroupImpl props

toggleGroupItem :: { value :: String, children :: Array JSX } -> JSX
toggleGroupItem props = toggleGroupItemImpl props
