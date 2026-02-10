module ShadCN.HoverCard where

import React.Basic (JSX, element)
import ShadCN.Radix as Radix

hoverCard :: Array JSX -> JSX
hoverCard kids = element Radix.hoverCardRoot { children: kids }

hoverCardTrigger :: Array JSX -> JSX
hoverCardTrigger kids = element Radix.hoverCardTrigger { children: kids }

hoverCardContent :: Array JSX -> JSX
hoverCardContent kids = element Radix.hoverCardPortal { children:
  [ element Radix.hoverCardContent { className: "bg-popover text-popover-foreground data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 data-[state=closed]:zoom-out-95 data-[state=open]:zoom-in-95 z-50 w-64 rounded-md border p-4 shadow-md outline-hidden", sideOffset: 4, children: kids } ] }
