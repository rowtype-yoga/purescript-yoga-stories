module ShadCN.DropdownMenu where

import React.Basic (JSX, element)
import ShadCN.Radix as Radix

dropdownMenu :: Array JSX -> JSX
dropdownMenu kids = element Radix.dropdownMenuRoot { children: kids }

dropdownMenuTrigger :: Array JSX -> JSX
dropdownMenuTrigger kids = element Radix.dropdownMenuTrigger { children: kids }

dropdownMenuContent :: Array JSX -> JSX
dropdownMenuContent kids = element Radix.dropdownMenuPortal { children:
  [ element Radix.dropdownMenuContent { className: "bg-popover text-popover-foreground data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 data-[state=closed]:zoom-out-95 data-[state=open]:zoom-in-95 z-50 min-w-[8rem] overflow-hidden rounded-md border p-1 shadow-md", sideOffset: 4, children: kids } ] }

dropdownMenuItem :: Array JSX -> JSX
dropdownMenuItem kids = element Radix.dropdownMenuItem { className: "focus:bg-accent focus:text-accent-foreground relative flex cursor-default items-center gap-2 rounded-sm px-2 py-1.5 text-sm outline-hidden select-none data-[disabled]:pointer-events-none data-[disabled]:opacity-50", children: kids }

dropdownMenuSeparator :: JSX
dropdownMenuSeparator = element Radix.dropdownMenuSeparator { className: "bg-border -mx-1 my-1 h-px" }

dropdownMenuLabel :: Array JSX -> JSX
dropdownMenuLabel kids = element Radix.dropdownMenuLabel { className: "px-2 py-1.5 text-sm font-medium", children: kids }
