module ShadCN.Dialog where

import React.Basic (JSX, element)
import React.Basic.DOM as R
import ShadCN.Radix as Radix

dialog :: Array JSX -> JSX
dialog kids = element Radix.dialogRoot { children: kids }

dialogTrigger :: Array JSX -> JSX
dialogTrigger kids = element Radix.dialogTrigger { children: kids }

dialogContent :: Array JSX -> JSX
dialogContent kids = element Radix.dialogPortal { children:
  [ element Radix.dialogOverlay { className: "data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 fixed inset-0 z-50 bg-black/50" }
  , element Radix.dialogContent { className: "bg-background data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 data-[state=closed]:zoom-out-95 data-[state=open]:zoom-in-95 fixed top-[50%] left-[50%] z-50 grid w-full max-w-[calc(100%-2rem)] translate-x-[-50%] translate-y-[-50%] gap-4 rounded-lg border p-6 shadow-lg duration-200 outline-none sm:max-w-lg", children: kids }
  ] }

dialogHeader :: Array JSX -> JSX
dialogHeader kids = R.div { className: "flex flex-col gap-2 text-center sm:text-left", children: kids }

dialogFooter :: Array JSX -> JSX
dialogFooter kids = R.div { className: "flex flex-col-reverse gap-2 sm:flex-row sm:justify-end", children: kids }

dialogTitle :: Array JSX -> JSX
dialogTitle kids = element Radix.dialogTitle { className: "text-lg leading-none font-semibold", children: kids }

dialogDescription :: Array JSX -> JSX
dialogDescription kids = element Radix.dialogDescription { className: "text-muted-foreground text-sm", children: kids }

dialogClose :: Array JSX -> JSX
dialogClose kids = element Radix.dialogClose { children: kids }
