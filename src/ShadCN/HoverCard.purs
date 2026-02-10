module ShadCN.HoverCard where

import React.Basic (JSX)
import Yoga.React.DOM.Internal (class IsJSX, createElement)
import ShadCN.Radix as Radix

hoverCard :: forall kids. IsJSX kids => kids -> JSX
hoverCard = createElement Radix.hoverCardRoot {}

hoverCardTrigger :: forall kids. IsJSX kids => kids -> JSX
hoverCardTrigger = createElement Radix.hoverCardTrigger {}

hoverCardContent :: forall kids. IsJSX kids => kids -> JSX
hoverCardContent kids = createElement Radix.hoverCardPortal {}
  [ createElement Radix.hoverCardContent { className: "bg-popover text-popover-foreground data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 data-[state=closed]:zoom-out-95 data-[state=open]:zoom-in-95 z-50 w-64 rounded-md border p-4 shadow-md outline-hidden", sideOffset: 4 } kids ]
