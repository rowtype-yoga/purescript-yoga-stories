module ShadCN.Kbd where

import React.Basic (JSX)
import Yoga.React.DOM.HTML (kbd)
import Yoga.React.DOM.Internal (class IsJSX)

kbdKey :: forall kids. IsJSX kids => kids -> JSX
kbdKey = kbd { className: "bg-muted text-muted-foreground pointer-events-none inline-flex h-5 w-fit min-w-5 items-center justify-center gap-1 rounded-sm px-1 font-sans text-xs font-medium select-none" }

kbdGroup :: forall kids. IsJSX kids => kids -> JSX
kbdGroup = kbd { className: "inline-flex items-center gap-1" }
