module ShadCN.Tooltip where

import React.Basic (JSX)

foreign import tooltipProviderImpl :: forall r. Record r -> JSX
foreign import tooltipImpl :: forall r. Record r -> JSX
foreign import tooltipTriggerImpl :: forall r. Record r -> JSX
foreign import tooltipContentImpl :: forall r. Record r -> JSX

tooltipProvider :: Array JSX -> JSX
tooltipProvider kids = tooltipProviderImpl { children: kids }

tooltip :: Array JSX -> JSX
tooltip kids = tooltipImpl { children: kids }

tooltipTrigger :: Array JSX -> JSX
tooltipTrigger kids = tooltipTriggerImpl { children: kids }

tooltipContent :: Array JSX -> JSX
tooltipContent kids = tooltipContentImpl { children: kids }
