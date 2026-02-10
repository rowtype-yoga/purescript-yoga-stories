module ShadCN.Select where

import React.Basic (JSX, element)
import React.Basic.DOM as R
import ShadCN.Radix as Radix

select :: Array JSX -> JSX
select kids = element Radix.selectRoot { children: kids }

selectTrigger :: Array JSX -> JSX
selectTrigger kids = element Radix.selectTrigger { className: "border-input data-[placeholder]:text-muted-foreground focus-visible:border-ring focus-visible:ring-ring/50 dark:bg-input/30 flex w-fit items-center justify-between gap-2 rounded-md border bg-transparent px-3 py-2 text-sm whitespace-nowrap shadow-xs transition-[color,box-shadow] outline-none focus-visible:ring-[3px] disabled:cursor-not-allowed disabled:opacity-50 h-9", children: kids }

selectValue :: String -> JSX
selectValue placeholder = element Radix.selectValue { placeholder }

selectContent :: Array JSX -> JSX
selectContent kids = element Radix.selectPortal { children:
  [ element Radix.selectContent { className: "bg-popover text-popover-foreground data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 data-[state=closed]:zoom-out-95 data-[state=open]:zoom-in-95 relative z-50 min-w-[8rem] overflow-hidden rounded-md border shadow-md", children:
    [ element Radix.selectViewport { className: "p-1", children: kids } ] } ] }

selectItem :: String -> Array JSX -> JSX
selectItem value kids = element Radix.selectItem { className: "focus:bg-accent focus:text-accent-foreground relative flex w-full cursor-default items-center gap-2 rounded-sm py-1.5 pr-8 pl-2 text-sm outline-hidden select-none data-[disabled]:pointer-events-none data-[disabled]:opacity-50", value, children:
  [ element Radix.selectItemText { children: kids } ] }

selectGroup :: Array JSX -> JSX
selectGroup kids = element Radix.selectGroup { children: kids }

selectLabel :: Array JSX -> JSX
selectLabel kids = element Radix.selectLabel { className: "text-muted-foreground px-2 py-1.5 text-xs", children: kids }

selectSeparator :: JSX
selectSeparator = element Radix.selectSeparator { className: "bg-border pointer-events-none -mx-1 my-1 h-px" }
