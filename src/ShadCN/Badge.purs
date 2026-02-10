module ShadCN.Badge where

import Prelude
import React.Basic (JSX)
import Yoga.React.DOM.HTML (span)
import Yoga.React.DOM.Internal (class IsJSX)

base :: String
base = "inline-flex items-center justify-center rounded-full border border-transparent px-2 py-0.5 text-xs font-medium w-fit whitespace-nowrap shrink-0 gap-1 transition-[color,box-shadow] overflow-hidden"

badgeDefault :: forall kids. IsJSX kids => kids -> JSX
badgeDefault = span { className: base <> " bg-primary text-primary-foreground" }

badgeSecondary :: forall kids. IsJSX kids => kids -> JSX
badgeSecondary = span { className: base <> " bg-secondary text-secondary-foreground" }

badgeDestructive :: forall kids. IsJSX kids => kids -> JSX
badgeDestructive = span { className: base <> " bg-destructive text-white" }

badgeOutline :: forall kids. IsJSX kids => kids -> JSX
badgeOutline = span { className: base <> " border-border text-foreground" }
