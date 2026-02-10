module ShadCN.Menubar where

import Prelude
import React.Basic (JSX, element)
import ShadCN.Radix as Radix

menubar :: Array JSX -> JSX
menubar kids = element Radix.menubarRoot { className: "bg-background flex h-9 items-center gap-1 rounded-md border p-1 shadow-xs", children: kids }

menubarMenu :: Array JSX -> JSX
menubarMenu kids = element Radix.menubarMenu { children: kids }

menubarTrigger :: Array JSX -> JSX
menubarTrigger kids = element Radix.menubarTrigger { className: "focus:bg-accent focus:text-accent-foreground data-[state=open]:bg-accent data-[state=open]:text-accent-foreground flex items-center rounded-sm px-2 py-1 text-sm font-medium outline-hidden select-none", children: kids }

menubarContent :: Array JSX -> JSX
menubarContent kids = element Radix.menubarPortal
  { children:
      [ element Radix.menubarContent { className: "bg-popover text-popover-foreground data-[state=open]:animate-in data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 z-50 min-w-[12rem] overflow-hidden rounded-md border p-1 shadow-md", sideOffset: 8, alignOffset: -4, children: kids } ]
  }

menubarItem :: Array JSX -> JSX
menubarItem kids = element Radix.menubarItem { className: "focus:bg-accent focus:text-accent-foreground relative flex cursor-default items-center gap-2 rounded-sm px-2 py-1.5 text-sm outline-hidden select-none data-[disabled]:pointer-events-none data-[disabled]:opacity-50", children: kids }

menubarSeparator :: JSX
menubarSeparator = element Radix.menubarSeparator { className: "bg-border -mx-1 my-1 h-px" }
