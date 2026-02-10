module ShadCN.Sheet where

import Prelude
import React.Basic (JSX, element)
import React.Basic.DOM as R
import ShadCN.Radix as Radix

sheet :: Array JSX -> JSX
sheet kids = element Radix.dialogRoot { children: kids }

sheetTrigger :: Array JSX -> JSX
sheetTrigger kids = element Radix.dialogTrigger { children: kids }

sheetContent :: String -> Array JSX -> JSX
sheetContent side kids = element Radix.dialogPortal { children:
  [ element Radix.dialogOverlay { className: "data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 fixed inset-0 z-50 bg-black/50" }
  , element Radix.dialogContent { className: "bg-background data-[state=open]:animate-in data-[state=closed]:animate-out fixed z-50 flex flex-col gap-4 shadow-lg transition ease-in-out data-[state=closed]:duration-300 data-[state=open]:duration-500 " <> sideClass side, children: kids }
  ] }
  where
  sideClass "left" = "data-[state=closed]:slide-out-to-left data-[state=open]:slide-in-from-left inset-y-0 left-0 h-full w-3/4 border-r sm:max-w-sm"
  sideClass "top" = "data-[state=closed]:slide-out-to-top data-[state=open]:slide-in-from-top inset-x-0 top-0 h-auto border-b"
  sideClass "bottom" = "data-[state=closed]:slide-out-to-bottom data-[state=open]:slide-in-from-bottom inset-x-0 bottom-0 h-auto border-t"
  sideClass _ = "data-[state=closed]:slide-out-to-right data-[state=open]:slide-in-from-right inset-y-0 right-0 h-full w-3/4 border-l sm:max-w-sm"

sheetHeader :: Array JSX -> JSX
sheetHeader kids = R.div { className: "flex flex-col gap-1.5 p-4", children: kids }

sheetFooter :: Array JSX -> JSX
sheetFooter kids = R.div { className: "mt-auto flex flex-col gap-2 p-4", children: kids }

sheetTitle :: Array JSX -> JSX
sheetTitle kids = element Radix.dialogTitle { className: "text-foreground font-semibold", children: kids }

sheetDescription :: Array JSX -> JSX
sheetDescription kids = element Radix.dialogDescription { className: "text-muted-foreground text-sm", children: kids }

sheetClose :: Array JSX -> JSX
sheetClose kids = element Radix.dialogClose { children: kids }
