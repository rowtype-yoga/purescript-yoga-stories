module ShadCN.Kbd where

import React.Basic (JSX)
import React.Basic.DOM as R

kbd :: Array JSX -> JSX
kbd kids = R.kbd { className: "bg-muted text-muted-foreground pointer-events-none inline-flex h-5 w-fit min-w-5 items-center justify-center gap-1 rounded-sm px-1 font-sans text-xs font-medium select-none", children: kids }

kbdGroup :: Array JSX -> JSX
kbdGroup kids = R.kbd { className: "inline-flex items-center gap-1", children: kids }
