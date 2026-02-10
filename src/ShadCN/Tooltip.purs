module ShadCN.Tooltip where

import React.Basic (JSX)
import Yoga.React.DOM.Internal (class IsJSX, createElement)
import ShadCN.Radix as Radix

tooltipProvider :: forall kids. IsJSX kids => kids -> JSX
tooltipProvider = createElement Radix.tooltipProvider { delayDuration: 0 }

tooltip :: forall kids. IsJSX kids => kids -> JSX
tooltip = createElement Radix.tooltipRoot {}

tooltipTrigger :: forall kids. IsJSX kids => kids -> JSX
tooltipTrigger = createElement Radix.tooltipTrigger {}

tooltipContent :: forall kids. IsJSX kids => kids -> JSX
tooltipContent kids = createElement Radix.tooltipPortal {}
  [ createElement Radix.tooltipContent { className: "bg-foreground text-background animate-in fade-in-0 zoom-in-95 data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=closed]:zoom-out-95 z-50 w-fit rounded-md px-3 py-1.5 text-xs text-balance", sideOffset: 0 } kids ]
