module ShadCN.Avatar where

import React.Basic (JSX, element)
import ShadCN.Radix as Radix

avatar :: Array JSX -> JSX
avatar kids = element Radix.avatarRoot { className: "relative flex size-8 shrink-0 overflow-hidden rounded-full select-none", children: kids }

avatarImage :: String -> JSX
avatarImage src = element Radix.avatarImage { className: "aspect-square size-full", src }

avatarFallback :: Array JSX -> JSX
avatarFallback kids = element Radix.avatarFallback { className: "bg-muted text-muted-foreground flex size-full items-center justify-center rounded-full text-sm", children: kids }
