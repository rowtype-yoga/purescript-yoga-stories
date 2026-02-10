module ShadCN.Toggle where

import Prelude
import React.Basic (JSX)
import Yoga.React.DOM.Internal (class IsJSX, createElement)
import ShadCN.Radix as Radix

toggleBase :: String
toggleBase = "inline-flex items-center justify-center gap-2 rounded-md text-sm font-medium hover:bg-muted hover:text-muted-foreground disabled:pointer-events-none disabled:opacity-50 data-[state=on]:bg-accent data-[state=on]:text-accent-foreground focus-visible:ring-ring/50 focus-visible:ring-[3px] outline-none transition-[color,box-shadow] whitespace-nowrap"

toggle :: forall kids. IsJSX kids => kids -> JSX
toggle = createElement Radix.toggleRoot { className: toggleBase <> " bg-transparent h-9 px-2 min-w-9" }

toggleOutline :: forall kids. IsJSX kids => kids -> JSX
toggleOutline = createElement Radix.toggleRoot { className: toggleBase <> " border border-input bg-transparent shadow-xs h-9 px-2 min-w-9" }

toggleSm :: forall kids. IsJSX kids => kids -> JSX
toggleSm = createElement Radix.toggleRoot { className: toggleBase <> " bg-transparent h-8 px-1.5 min-w-8" }

toggleLg :: forall kids. IsJSX kids => kids -> JSX
toggleLg = createElement Radix.toggleRoot { className: toggleBase <> " bg-transparent h-10 px-2.5 min-w-10" }
