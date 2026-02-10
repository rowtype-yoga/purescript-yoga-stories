module ShadCN.Sheet where

import Prelude
import React.Basic (JSX)
import Yoga.React.DOM.HTML (div)
import Yoga.React.DOM.Internal (class IsJSX, createElement)
import ShadCN.Radix as Radix

sheet :: forall kids. IsJSX kids => kids -> JSX
sheet = createElement Radix.dialogRoot {}

sheetTrigger :: forall kids. IsJSX kids => kids -> JSX
sheetTrigger = createElement Radix.dialogTrigger {}

sheetContent :: forall kids. IsJSX kids => String -> kids -> JSX
sheetContent side kids = createElement Radix.dialogPortal {}
  [ createElement Radix.dialogOverlay { className: "data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 fixed inset-0 z-50 bg-black/50" } ([] :: Array JSX)
  , createElement Radix.dialogContent { className: "bg-background data-[state=open]:animate-in data-[state=closed]:animate-out fixed z-50 flex flex-col gap-4 shadow-lg transition ease-in-out data-[state=closed]:duration-300 data-[state=open]:duration-500 " <> sideClass side } kids
  ]
  where
  sideClass "left" = "data-[state=closed]:slide-out-to-left data-[state=open]:slide-in-from-left inset-y-0 left-0 h-full w-3/4 border-r sm:max-w-sm"
  sideClass "top" = "data-[state=closed]:slide-out-to-top data-[state=open]:slide-in-from-top inset-x-0 top-0 h-auto border-b"
  sideClass "bottom" = "data-[state=closed]:slide-out-to-bottom data-[state=open]:slide-in-from-bottom inset-x-0 bottom-0 h-auto border-t"
  sideClass _ = "data-[state=closed]:slide-out-to-right data-[state=open]:slide-in-from-right inset-y-0 right-0 h-full w-3/4 border-l sm:max-w-sm"

sheetHeader :: forall kids. IsJSX kids => kids -> JSX
sheetHeader = div { className: "flex flex-col gap-1.5 p-4" }

sheetFooter :: forall kids. IsJSX kids => kids -> JSX
sheetFooter = div { className: "mt-auto flex flex-col gap-2 p-4" }

sheetTitle :: forall kids. IsJSX kids => kids -> JSX
sheetTitle = createElement Radix.dialogTitle { className: "text-foreground font-semibold" }

sheetDescription :: forall kids. IsJSX kids => kids -> JSX
sheetDescription = createElement Radix.dialogDescription { className: "text-muted-foreground text-sm" }

sheetClose :: forall kids. IsJSX kids => kids -> JSX
sheetClose = createElement Radix.dialogClose {}
