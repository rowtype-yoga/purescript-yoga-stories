module ShadCN.HoverCard where

import React.Basic (JSX)

foreign import hoverCardImpl :: forall r. Record r -> JSX
foreign import hoverCardTriggerImpl :: forall r. Record r -> JSX
foreign import hoverCardContentImpl :: forall r. Record r -> JSX

hoverCard :: Array JSX -> JSX
hoverCard kids = hoverCardImpl { children: kids }

hoverCardTrigger :: Array JSX -> JSX
hoverCardTrigger kids = hoverCardTriggerImpl { children: kids }

hoverCardContent :: Array JSX -> JSX
hoverCardContent kids = hoverCardContentImpl { children: kids }
