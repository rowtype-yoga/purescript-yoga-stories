module ShadCN.RadioGroup where

import React.Basic (JSX)

foreign import radioGroupImpl :: forall r. Record r -> JSX
foreign import radioGroupItemImpl :: forall r. Record r -> JSX

radioGroup :: Array JSX -> JSX
radioGroup kids = radioGroupImpl { children: kids }

radioGroupItem :: { value :: String } -> JSX
radioGroupItem props = radioGroupItemImpl props
