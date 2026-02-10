module ShadCN.Collapsible where

import React.Basic (JSX)

foreign import collapsibleImpl :: forall r. Record r -> JSX
foreign import collapsibleTriggerImpl :: forall r. Record r -> JSX
foreign import collapsibleContentImpl :: forall r. Record r -> JSX

collapsible :: Array JSX -> JSX
collapsible kids = collapsibleImpl { children: kids }

collapsibleTrigger :: Array JSX -> JSX
collapsibleTrigger kids = collapsibleTriggerImpl { children: kids }

collapsibleContent :: Array JSX -> JSX
collapsibleContent kids = collapsibleContentImpl { children: kids }
