module ShadCN.Button where

import Prelude
import React.Basic (JSX)
import React.Basic.DOM as R

buttonBase :: String
buttonBase = "inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium transition-all disabled:pointer-events-none disabled:opacity-50 outline-none focus-visible:border-ring focus-visible:ring-ring/50 focus-visible:ring-[3px]"

buttonDefault :: Array JSX -> JSX
buttonDefault kids = R.button { className: buttonBase <> " bg-primary text-primary-foreground hover:bg-primary/90 h-9 px-4 py-2", children: kids }

buttonDestructive :: Array JSX -> JSX
buttonDestructive kids = R.button { className: buttonBase <> " bg-destructive text-white hover:bg-destructive/90 h-9 px-4 py-2", children: kids }

buttonOutline :: Array JSX -> JSX
buttonOutline kids = R.button { className: buttonBase <> " border bg-background shadow-xs hover:bg-accent hover:text-accent-foreground h-9 px-4 py-2", children: kids }

buttonSecondary :: Array JSX -> JSX
buttonSecondary kids = R.button { className: buttonBase <> " bg-secondary text-secondary-foreground hover:bg-secondary/80 h-9 px-4 py-2", children: kids }

buttonGhost :: Array JSX -> JSX
buttonGhost kids = R.button { className: buttonBase <> " hover:bg-accent hover:text-accent-foreground h-9 px-4 py-2", children: kids }

buttonLink :: Array JSX -> JSX
buttonLink kids = R.button { className: buttonBase <> " text-primary underline-offset-4 hover:underline h-9 px-4 py-2", children: kids }

buttonSm :: Array JSX -> JSX
buttonSm kids = R.button { className: buttonBase <> " bg-primary text-primary-foreground hover:bg-primary/90 h-8 rounded-md gap-1.5 px-3", children: kids }

buttonLg :: Array JSX -> JSX
buttonLg kids = R.button { className: buttonBase <> " bg-primary text-primary-foreground hover:bg-primary/90 h-10 rounded-md px-6", children: kids }

buttonIcon :: Array JSX -> JSX
buttonIcon kids = R.button { className: buttonBase <> " bg-primary text-primary-foreground hover:bg-primary/90 size-9", children: kids }
