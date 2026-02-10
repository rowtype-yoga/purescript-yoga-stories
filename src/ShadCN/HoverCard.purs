module ShadCN.HoverCard where

import React.Basic (JSX)

foreign import hoverCardImpl :: forall r. Record r -> JSX
foreign import hoverCardTriggerImpl :: forall r. Record r -> JSX
foreign import hoverCardContentImpl :: forall r. Record r -> JSX

hoverCard :: { children :: Array JSX } -> JSX
hoverCard props = hoverCardImpl props

hoverCardTrigger :: { children :: Array JSX } -> JSX
hoverCardTrigger props = hoverCardTriggerImpl props

hoverCardContent :: { children :: Array JSX } -> JSX
hoverCardContent props = hoverCardContentImpl props
