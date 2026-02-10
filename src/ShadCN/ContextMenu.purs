module ShadCN.ContextMenu where

import React.Basic (JSX)
import Yoga.React.DOM.Internal (class IsJSX, createElement)
import ShadCN.Radix as Radix

contextMenu :: forall kids. IsJSX kids => kids -> JSX
contextMenu = createElement Radix.contextMenuRoot {}

contextMenuTrigger :: forall kids. IsJSX kids => kids -> JSX
contextMenuTrigger = createElement Radix.contextMenuTrigger {}

contextMenuContent :: forall kids. IsJSX kids => kids -> JSX
contextMenuContent kids = createElement Radix.contextMenuPortal {}
  [ createElement Radix.contextMenuContent { className: "bg-popover text-popover-foreground data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 data-[state=closed]:zoom-out-95 data-[state=open]:zoom-in-95 z-50 min-w-[8rem] overflow-hidden rounded-md border p-1 shadow-md" } kids ]

contextMenuItem :: forall kids. IsJSX kids => kids -> JSX
contextMenuItem = createElement Radix.contextMenuItem { className: "focus:bg-accent focus:text-accent-foreground relative flex cursor-default items-center gap-2 rounded-sm px-2 py-1.5 text-sm outline-hidden select-none data-[disabled]:pointer-events-none data-[disabled]:opacity-50" }

contextMenuSeparator :: JSX
contextMenuSeparator = createElement Radix.contextMenuSeparator { className: "bg-border -mx-1 my-1 h-px" } ([] :: Array JSX)

contextMenuLabel :: forall kids. IsJSX kids => kids -> JSX
contextMenuLabel = createElement Radix.contextMenuLabel { className: "text-foreground px-2 py-1.5 text-sm font-medium" }
