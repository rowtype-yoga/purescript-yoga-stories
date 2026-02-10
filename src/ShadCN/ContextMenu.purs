module ShadCN.ContextMenu where

import React.Basic (JSX, element)
import ShadCN.Radix as Radix

contextMenu :: Array JSX -> JSX
contextMenu kids = element Radix.contextMenuRoot { children: kids }

contextMenuTrigger :: Array JSX -> JSX
contextMenuTrigger kids = element Radix.contextMenuTrigger { children: kids }

contextMenuContent :: Array JSX -> JSX
contextMenuContent kids = element Radix.contextMenuPortal { children:
  [ element Radix.contextMenuContent { className: "bg-popover text-popover-foreground data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 data-[state=closed]:zoom-out-95 data-[state=open]:zoom-in-95 z-50 min-w-[8rem] overflow-hidden rounded-md border p-1 shadow-md", children: kids } ] }

contextMenuItem :: Array JSX -> JSX
contextMenuItem kids = element Radix.contextMenuItem { className: "focus:bg-accent focus:text-accent-foreground relative flex cursor-default items-center gap-2 rounded-sm px-2 py-1.5 text-sm outline-hidden select-none data-[disabled]:pointer-events-none data-[disabled]:opacity-50", children: kids }

contextMenuSeparator :: JSX
contextMenuSeparator = element Radix.contextMenuSeparator { className: "bg-border -mx-1 my-1 h-px" }

contextMenuLabel :: Array JSX -> JSX
contextMenuLabel kids = element Radix.contextMenuLabel { className: "text-foreground px-2 py-1.5 text-sm font-medium", children: kids }
