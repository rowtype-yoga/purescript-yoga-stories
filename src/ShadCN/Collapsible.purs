module ShadCN.Collapsible where

import React.Basic (JSX)

foreign import collapsibleImpl :: forall r. Record r -> JSX
foreign import collapsibleTriggerImpl :: forall r. Record r -> JSX
foreign import collapsibleContentImpl :: forall r. Record r -> JSX

collapsible :: { children :: Array JSX } -> JSX
collapsible props = collapsibleImpl props

collapsibleTrigger :: { children :: Array JSX } -> JSX
collapsibleTrigger props = collapsibleTriggerImpl props

collapsibleContent :: { children :: Array JSX } -> JSX
collapsibleContent props = collapsibleContentImpl props
