module ShadCN.Tooltip where

import React.Basic (JSX)

foreign import tooltipProviderImpl :: forall r. Record r -> JSX
foreign import tooltipImpl :: forall r. Record r -> JSX
foreign import tooltipTriggerImpl :: forall r. Record r -> JSX
foreign import tooltipContentImpl :: forall r. Record r -> JSX

tooltipProvider :: { children :: Array JSX } -> JSX
tooltipProvider props = tooltipProviderImpl props

tooltip :: { children :: Array JSX } -> JSX
tooltip props = tooltipImpl props

tooltipTrigger :: { children :: Array JSX } -> JSX
tooltipTrigger props = tooltipTriggerImpl props

tooltipContent :: { children :: Array JSX } -> JSX
tooltipContent props = tooltipContentImpl props
