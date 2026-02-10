module ShadCN.Menubar where

import Prelude
import React.Basic (JSX)
import Yoga.React.DOM.Internal (class IsJSX, createElement)
import ShadCN.Radix as Radix

menubar :: forall kids. IsJSX kids => kids -> JSX
menubar = createElement Radix.menubarRoot { className: "bg-background flex h-9 items-center gap-1 rounded-md border p-1 shadow-xs" }

menubarMenu :: forall kids. IsJSX kids => kids -> JSX
menubarMenu = createElement Radix.menubarMenu {}

menubarTrigger :: forall kids. IsJSX kids => kids -> JSX
menubarTrigger = createElement Radix.menubarTrigger { className: "focus:bg-accent focus:text-accent-foreground data-[state=open]:bg-accent data-[state=open]:text-accent-foreground flex items-center rounded-sm px-2 py-1 text-sm font-medium outline-hidden select-none" }

menubarContent :: forall kids. IsJSX kids => kids -> JSX
menubarContent kids = createElement Radix.menubarPortal {}
  [ createElement Radix.menubarContent { className: "bg-popover text-popover-foreground data-[state=open]:animate-in data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 z-50 min-w-[12rem] overflow-hidden rounded-md border p-1 shadow-md", sideOffset: 8, alignOffset: negate 4 } kids ]

menubarItem :: forall kids. IsJSX kids => kids -> JSX
menubarItem = createElement Radix.menubarItem { className: "focus:bg-accent focus:text-accent-foreground relative flex cursor-default items-center gap-2 rounded-sm px-2 py-1.5 text-sm outline-hidden select-none data-[disabled]:pointer-events-none data-[disabled]:opacity-50" }

menubarSeparator :: JSX
menubarSeparator = createElement Radix.menubarSeparator { className: "bg-border -mx-1 my-1 h-px" } ([] :: Array JSX)
