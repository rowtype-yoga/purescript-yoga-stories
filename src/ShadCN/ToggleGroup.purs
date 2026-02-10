module ShadCN.ToggleGroup where

import React.Basic (JSX, element)
import ShadCN.Radix as Radix

toggleGroup :: String -> Array JSX -> JSX
toggleGroup type_ kids = element Radix.toggleGroupRoot { className: "flex w-fit items-center gap-0 rounded-md", type: type_, children: kids }

toggleGroupItem :: String -> Array JSX -> JSX
toggleGroupItem value kids = element Radix.toggleGroupItem { className: "inline-flex items-center justify-center gap-2 rounded-none text-sm font-medium hover:bg-muted hover:text-muted-foreground disabled:pointer-events-none disabled:opacity-50 data-[state=on]:bg-accent data-[state=on]:text-accent-foreground outline-none transition-[color,box-shadow] whitespace-nowrap first:rounded-l-md last:rounded-r-md h-9 px-3 min-w-9", value, children: kids }
