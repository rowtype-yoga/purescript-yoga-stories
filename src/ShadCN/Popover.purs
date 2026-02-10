module ShadCN.Popover where

import React.Basic (JSX)

foreign import popoverImpl :: forall r. Record r -> JSX
foreign import popoverTriggerImpl :: forall r. Record r -> JSX
foreign import popoverContentImpl :: forall r. Record r -> JSX

popover :: Array JSX -> JSX
popover kids = popoverImpl { children: kids }

popoverTrigger :: Array JSX -> JSX
popoverTrigger kids = popoverTriggerImpl { children: kids }

popoverContent :: Array JSX -> JSX
popoverContent kids = popoverContentImpl { children: kids }
