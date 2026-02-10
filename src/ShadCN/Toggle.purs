module ShadCN.Toggle where

import Prelude
import React.Basic (JSX, element)
import ShadCN.Radix as Radix

toggleBase :: String
toggleBase = "inline-flex items-center justify-center gap-2 rounded-md text-sm font-medium hover:bg-muted hover:text-muted-foreground disabled:pointer-events-none disabled:opacity-50 data-[state=on]:bg-accent data-[state=on]:text-accent-foreground focus-visible:ring-ring/50 focus-visible:ring-[3px] outline-none transition-[color,box-shadow] whitespace-nowrap"

toggle :: Array JSX -> JSX
toggle kids = element Radix.toggleRoot { className: toggleBase <> " bg-transparent h-9 px-2 min-w-9", children: kids }

toggleOutline :: Array JSX -> JSX
toggleOutline kids = element Radix.toggleRoot { className: toggleBase <> " border border-input bg-transparent shadow-xs h-9 px-2 min-w-9", children: kids }

toggleSm :: Array JSX -> JSX
toggleSm kids = element Radix.toggleRoot { className: toggleBase <> " bg-transparent h-8 px-1.5 min-w-8", children: kids }

toggleLg :: Array JSX -> JSX
toggleLg kids = element Radix.toggleRoot { className: toggleBase <> " bg-transparent h-10 px-2.5 min-w-10", children: kids }
