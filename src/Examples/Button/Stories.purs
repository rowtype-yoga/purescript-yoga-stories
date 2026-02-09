module Examples.Button.Stories where

import React.Basic (JSX)
import Examples.Button (mkButton)
import YogaStories.Story (story)

primary :: JSX
primary = story "primary" mkButton { label: "Submit", variant: "primary" }

danger :: JSX
danger = story "danger" mkButton { label: "Delete", variant: "danger" }

secondary :: JSX
secondary = story "secondary" mkButton { label: "Cancel", variant: "secondary" }
