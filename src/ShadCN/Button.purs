module ShadCN.Button where

import Prelude
import React.Basic (JSX)
import Yoga.React.DOM.HTML (button)
import Yoga.React.DOM.Internal (class IsJSX)

-- | Variant x Size -> kids -> JSX
btn :: String -> String -> forall kids. IsJSX kids => kids -> JSX
btn variant size = button { className: base <> " " <> variant <> " " <> size }

-- Variants
default :: String
default = "bg-primary text-primary-foreground hover:bg-primary/90"

destructive :: String
destructive = "bg-destructive text-white hover:bg-destructive/90"

outline :: String
outline = "border bg-background shadow-xs hover:bg-accent hover:text-accent-foreground"

secondary :: String
secondary = "bg-secondary text-secondary-foreground hover:bg-secondary/80"

ghost :: String
ghost = "hover:bg-accent hover:text-accent-foreground"

link :: String
link = "text-primary underline-offset-4 hover:underline"

-- Sizes
md :: String
md = "h-9 px-4 py-2"

sm :: String
sm = "h-8 rounded-md gap-1.5 px-3"

lg :: String
lg = "h-10 rounded-md px-6"

xs :: String
xs = "h-6 gap-1 rounded-md px-2 text-xs"

icon :: String
icon = "size-9"

base :: String
base = "inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium transition-all disabled:pointer-events-none disabled:opacity-50 outline-none focus-visible:border-ring focus-visible:ring-ring/50 focus-visible:ring-[3px]"
