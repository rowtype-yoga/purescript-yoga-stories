module ShadCN.DropdownMenu where

import React.Basic (JSX)
import Yoga.React.DOM.Internal (class IsJSX, createElement)
import ShadCN.Radix as Radix

dropdownMenu :: forall kids. IsJSX kids => kids -> JSX
dropdownMenu = createElement Radix.dropdownMenuRoot {}

dropdownMenuTrigger :: forall kids. IsJSX kids => kids -> JSX
dropdownMenuTrigger = createElement Radix.dropdownMenuTrigger {}

dropdownMenuContent :: forall kids. IsJSX kids => kids -> JSX
dropdownMenuContent kids = createElement Radix.dropdownMenuPortal {}
  [ createElement Radix.dropdownMenuContent { className: "bg-popover text-popover-foreground data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 data-[state=closed]:zoom-out-95 data-[state=open]:zoom-in-95 z-50 min-w-[8rem] overflow-hidden rounded-md border p-1 shadow-md", sideOffset: 4 } kids ]

dropdownMenuItem :: forall kids. IsJSX kids => kids -> JSX
dropdownMenuItem = createElement Radix.dropdownMenuItem { className: "focus:bg-accent focus:text-accent-foreground relative flex cursor-default items-center gap-2 rounded-sm px-2 py-1.5 text-sm outline-hidden select-none data-[disabled]:pointer-events-none data-[disabled]:opacity-50" }

dropdownMenuSeparator :: JSX
dropdownMenuSeparator = createElement Radix.dropdownMenuSeparator { className: "bg-border -mx-1 my-1 h-px" } ([] :: Array JSX)

dropdownMenuLabel :: forall kids. IsJSX kids => kids -> JSX
dropdownMenuLabel = createElement Radix.dropdownMenuLabel { className: "px-2 py-1.5 text-sm font-medium" }
