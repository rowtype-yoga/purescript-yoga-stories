module ShadCN.ToggleGroup where

import React.Basic (JSX)

foreign import toggleGroupImpl :: forall r. Record r -> JSX
foreign import toggleGroupItemImpl :: forall r. Record r -> JSX

toggleGroup :: String -> Array JSX -> JSX
toggleGroup type_ kids = toggleGroupImpl { type: type_, children: kids }

toggleGroupItem :: String -> Array JSX -> JSX
toggleGroupItem value kids = toggleGroupItemImpl { value, children: kids }
