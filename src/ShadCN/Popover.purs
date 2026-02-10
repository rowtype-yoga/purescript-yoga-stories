module ShadCN.Popover where

import React.Basic (JSX)
import Yoga.React.DOM.Internal (class IsJSX, createElement)
import ShadCN.Radix as Radix

popover :: forall kids. IsJSX kids => kids -> JSX
popover = createElement Radix.popoverRoot {}

popoverTrigger :: forall kids. IsJSX kids => kids -> JSX
popoverTrigger = createElement Radix.popoverTrigger {}

popoverContent :: forall kids. IsJSX kids => kids -> JSX
popoverContent kids = createElement Radix.popoverPortal {}
  [ createElement Radix.popoverContent { className: "bg-popover text-popover-foreground data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 data-[state=closed]:zoom-out-95 data-[state=open]:zoom-in-95 z-50 w-72 rounded-md border p-4 shadow-md outline-hidden", sideOffset: 4 } kids ]
