module ShadCN.Popover where

import React.Basic (JSX, element)
import ShadCN.Radix as Radix

popover :: Array JSX -> JSX
popover kids = element Radix.popoverRoot { children: kids }

popoverTrigger :: Array JSX -> JSX
popoverTrigger kids = element Radix.popoverTrigger { children: kids }

popoverContent :: Array JSX -> JSX
popoverContent kids = element Radix.popoverPortal { children:
  [ element Radix.popoverContent { className: "bg-popover text-popover-foreground data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 data-[state=closed]:zoom-out-95 data-[state=open]:zoom-in-95 z-50 w-72 rounded-md border p-4 shadow-md outline-hidden", sideOffset: 4, children: kids } ] }
