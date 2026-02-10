module ShadCN.InputGroup where

import React.Basic (JSX)
import Yoga.React.DOM.HTML (div, span)
import Yoga.React.DOM.Internal (class IsJSX)

inputGroup :: forall kids. IsJSX kids => kids -> JSX
inputGroup = div { className: "border-input dark:bg-input/30 relative flex w-full items-center rounded-md border shadow-xs transition-[color,box-shadow] outline-none h-9 min-w-0", role: "group" }

inputGroupAddon :: forall kids. IsJSX kids => kids -> JSX
inputGroupAddon = div { className: "text-muted-foreground flex h-auto items-center justify-center gap-2 py-1.5 text-sm font-medium select-none order-first pl-3" }

inputGroupText :: forall kids. IsJSX kids => kids -> JSX
inputGroupText = span { className: "text-muted-foreground flex items-center gap-2 text-sm" }
