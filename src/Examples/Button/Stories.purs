module Examples.Button.Stories where

import React.Basic (JSX)
import Examples.Button (mkButton)

primary :: JSX
primary = mkButton { label: "Submit", variant: "primary" }

danger :: JSX
danger = mkButton { label: "Delete", variant: "danger" }

secondary :: JSX
secondary = mkButton { label: "Cancel", variant: "secondary" }
