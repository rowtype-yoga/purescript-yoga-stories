module ShadCN.Select where

import React.Basic (JSX)
import Yoga.React.DOM.Internal (class IsJSX, createElement)
import ShadCN.Radix as Radix

select :: forall kids. IsJSX kids => kids -> JSX
select = createElement Radix.selectRoot {}

selectTrigger :: forall kids. IsJSX kids => kids -> JSX
selectTrigger = createElement Radix.selectTrigger { className: "border-input data-[placeholder]:text-muted-foreground focus-visible:border-ring focus-visible:ring-ring/50 dark:bg-input/30 flex w-fit items-center justify-between gap-2 rounded-md border bg-transparent px-3 py-2 text-sm whitespace-nowrap shadow-xs transition-[color,box-shadow] outline-none focus-visible:ring-[3px] disabled:cursor-not-allowed disabled:opacity-50 h-9" }

selectValue :: String -> JSX
selectValue placeholder = createElement Radix.selectValue { placeholder } ([] :: Array JSX)

selectContent :: forall kids. IsJSX kids => kids -> JSX
selectContent kids = createElement Radix.selectPortal {}
  [ createElement Radix.selectContent { className: "bg-popover text-popover-foreground data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 data-[state=closed]:zoom-out-95 data-[state=open]:zoom-in-95 relative z-50 min-w-[8rem] overflow-hidden rounded-md border shadow-md" }
    [ createElement Radix.selectViewport { className: "p-1" } kids ] ]

selectItem :: forall kids. IsJSX kids => String -> kids -> JSX
selectItem value kids = createElement Radix.selectItem { className: "focus:bg-accent focus:text-accent-foreground relative flex w-full cursor-default items-center gap-2 rounded-sm py-1.5 pr-8 pl-2 text-sm outline-hidden select-none data-[disabled]:pointer-events-none data-[disabled]:opacity-50", value }
  [ createElement Radix.selectItemText {} kids ]

selectGroup :: forall kids. IsJSX kids => kids -> JSX
selectGroup = createElement Radix.selectGroup {}

selectLabel :: forall kids. IsJSX kids => kids -> JSX
selectLabel = createElement Radix.selectLabel { className: "text-muted-foreground px-2 py-1.5 text-xs" }

selectSeparator :: JSX
selectSeparator = createElement Radix.selectSeparator { className: "bg-border pointer-events-none -mx-1 my-1 h-px" } ([] :: Array JSX)
