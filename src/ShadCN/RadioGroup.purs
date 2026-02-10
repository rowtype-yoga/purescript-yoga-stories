module ShadCN.RadioGroup where

import React.Basic (JSX)

foreign import radioGroupImpl :: forall r. Record r -> JSX
foreign import radioGroupItemImpl :: forall r. Record r -> JSX

radioGroup :: { children :: Array JSX } -> JSX
radioGroup props = radioGroupImpl props

radioGroupItem :: { value :: String } -> JSX
radioGroupItem props = radioGroupItemImpl props
