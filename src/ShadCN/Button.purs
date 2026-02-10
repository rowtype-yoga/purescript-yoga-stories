module ShadCN.Button where

import Prelude
import React.Basic (JSX)
import Yoga.React.DOM.HTML (button)
import Yoga.React.DOM.Internal (class IsJSX)

buttonBase :: String
buttonBase = "inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium transition-all disabled:pointer-events-none disabled:opacity-50 outline-none focus-visible:border-ring focus-visible:ring-ring/50 focus-visible:ring-[3px]"

buttonDefault :: forall kids. IsJSX kids => kids -> JSX
buttonDefault = button { className: buttonBase <> " bg-primary text-primary-foreground hover:bg-primary/90 h-9 px-4 py-2" }

buttonDestructive :: forall kids. IsJSX kids => kids -> JSX
buttonDestructive = button { className: buttonBase <> " bg-destructive text-white hover:bg-destructive/90 h-9 px-4 py-2" }

buttonOutline :: forall kids. IsJSX kids => kids -> JSX
buttonOutline = button { className: buttonBase <> " border bg-background shadow-xs hover:bg-accent hover:text-accent-foreground h-9 px-4 py-2" }

buttonSecondary :: forall kids. IsJSX kids => kids -> JSX
buttonSecondary = button { className: buttonBase <> " bg-secondary text-secondary-foreground hover:bg-secondary/80 h-9 px-4 py-2" }

buttonGhost :: forall kids. IsJSX kids => kids -> JSX
buttonGhost = button { className: buttonBase <> " hover:bg-accent hover:text-accent-foreground h-9 px-4 py-2" }

buttonLink :: forall kids. IsJSX kids => kids -> JSX
buttonLink = button { className: buttonBase <> " text-primary underline-offset-4 hover:underline h-9 px-4 py-2" }

buttonSm :: forall kids. IsJSX kids => kids -> JSX
buttonSm = button { className: buttonBase <> " bg-primary text-primary-foreground hover:bg-primary/90 h-8 rounded-md gap-1.5 px-3" }

buttonLg :: forall kids. IsJSX kids => kids -> JSX
buttonLg = button { className: buttonBase <> " bg-primary text-primary-foreground hover:bg-primary/90 h-10 rounded-md px-6" }

buttonIcon :: forall kids. IsJSX kids => kids -> JSX
buttonIcon = button { className: buttonBase <> " bg-primary text-primary-foreground hover:bg-primary/90 size-9" }
