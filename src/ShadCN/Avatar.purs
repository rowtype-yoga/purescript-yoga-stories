module ShadCN.Avatar where

import React.Basic (JSX)
import Yoga.React.DOM.Internal (class IsJSX, createElement)
import ShadCN.Radix as Radix

avatar :: forall kids. IsJSX kids => kids -> JSX
avatar = createElement Radix.avatarRoot { className: "relative flex size-8 shrink-0 overflow-hidden rounded-full select-none" }

avatarImage :: String -> JSX
avatarImage src = createElement Radix.avatarImage { className: "aspect-square size-full", src } ([] :: Array JSX)

avatarFallback :: forall kids. IsJSX kids => kids -> JSX
avatarFallback = createElement Radix.avatarFallback { className: "bg-muted text-muted-foreground flex size-full items-center justify-center rounded-full text-sm" }
