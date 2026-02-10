module ShadCN.Tooltip where

import React.Basic (JSX, element)
import ShadCN.Radix as Radix

tooltipProvider :: Array JSX -> JSX
tooltipProvider kids = element Radix.tooltipProvider { delayDuration: 0, children: kids }

tooltip :: Array JSX -> JSX
tooltip kids = element Radix.tooltipRoot { children: kids }

tooltipTrigger :: Array JSX -> JSX
tooltipTrigger kids = element Radix.tooltipTrigger { children: kids }

tooltipContent :: Array JSX -> JSX
tooltipContent kids = element Radix.tooltipPortal { children:
  [ element Radix.tooltipContent { className: "bg-foreground text-background animate-in fade-in-0 zoom-in-95 data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=closed]:zoom-out-95 z-50 w-fit rounded-md px-3 py-1.5 text-xs text-balance", sideOffset: 0, children: kids } ] }
