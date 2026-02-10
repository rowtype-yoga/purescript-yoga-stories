module ShadCN.Dialog where

import React.Basic (JSX)
import Yoga.React.DOM.HTML (div)
import Yoga.React.DOM.Internal (class IsJSX, createElement)
import ShadCN.Radix as Radix

dialog :: forall kids. IsJSX kids => kids -> JSX
dialog = createElement Radix.dialogRoot {}

dialogTrigger :: forall kids. IsJSX kids => kids -> JSX
dialogTrigger = createElement Radix.dialogTrigger {}

dialogContent :: forall kids. IsJSX kids => kids -> JSX
dialogContent kids = createElement Radix.dialogPortal {}
  [ createElement Radix.dialogOverlay { className: "data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 fixed inset-0 z-50 bg-black/50" } ([] :: Array JSX)
  , createElement Radix.dialogContent { className: "bg-background data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 data-[state=closed]:zoom-out-95 data-[state=open]:zoom-in-95 fixed top-[50%] left-[50%] z-50 grid w-full max-w-[calc(100%-2rem)] translate-x-[-50%] translate-y-[-50%] gap-4 rounded-lg border p-6 shadow-lg duration-200 outline-none sm:max-w-lg" } kids
  ]

dialogHeader :: forall kids. IsJSX kids => kids -> JSX
dialogHeader = div { className: "flex flex-col gap-2 text-center sm:text-left" }

dialogFooter :: forall kids. IsJSX kids => kids -> JSX
dialogFooter = div { className: "flex flex-col-reverse gap-2 sm:flex-row sm:justify-end" }

dialogTitle :: forall kids. IsJSX kids => kids -> JSX
dialogTitle = createElement Radix.dialogTitle { className: "text-lg leading-none font-semibold" }

dialogDescription :: forall kids. IsJSX kids => kids -> JSX
dialogDescription = createElement Radix.dialogDescription { className: "text-muted-foreground text-sm" }

dialogClose :: forall kids. IsJSX kids => kids -> JSX
dialogClose = createElement Radix.dialogClose {}
