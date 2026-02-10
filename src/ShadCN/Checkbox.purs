module ShadCN.Checkbox where

import React.Basic (JSX)

foreign import checkboxImpl :: forall r. Record r -> JSX

checkbox :: {} -> JSX
checkbox props = checkboxImpl props
