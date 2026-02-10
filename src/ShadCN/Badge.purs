module ShadCN.Badge where

import Prelude
import React.Basic (JSX)
import React.Basic.DOM as R

base :: String
base = "inline-flex items-center justify-center rounded-full border border-transparent px-2 py-0.5 text-xs font-medium w-fit whitespace-nowrap shrink-0 gap-1 transition-[color,box-shadow] overflow-hidden"

badgeDefault :: Array JSX -> JSX
badgeDefault kids = R.span { className: base <> " bg-primary text-primary-foreground", children: kids }

badgeSecondary :: Array JSX -> JSX
badgeSecondary kids = R.span { className: base <> " bg-secondary text-secondary-foreground", children: kids }

badgeDestructive :: Array JSX -> JSX
badgeDestructive kids = R.span { className: base <> " bg-destructive text-white", children: kids }

badgeOutline :: Array JSX -> JSX
badgeOutline kids = R.span { className: base <> " border-border text-foreground", children: kids }
