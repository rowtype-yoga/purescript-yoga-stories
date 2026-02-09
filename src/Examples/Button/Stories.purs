module Examples.Button.Stories where

import React.Basic (JSX)
import Examples.Button (mkButton)

type Story = { component :: { label :: String, variant :: String } -> JSX, defaults :: { label :: String, variant :: String } }

primary :: Story
primary = { component: mkButton, defaults: { label: "Submit", variant: "primary" } }

danger :: Story
danger = { component: mkButton, defaults: { label: "Delete", variant: "danger" } }

secondary :: Story
secondary = { component: mkButton, defaults: { label: "Cancel", variant: "secondary" } }
