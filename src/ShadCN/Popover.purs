module ShadCN.Popover where

import React.Basic (JSX)

foreign import popoverImpl :: forall r. Record r -> JSX
foreign import popoverTriggerImpl :: forall r. Record r -> JSX
foreign import popoverContentImpl :: forall r. Record r -> JSX

popover :: { children :: Array JSX } -> JSX
popover props = popoverImpl props

popoverTrigger :: { children :: Array JSX } -> JSX
popoverTrigger props = popoverTriggerImpl props

popoverContent :: { children :: Array JSX } -> JSX
popoverContent props = popoverContentImpl props
