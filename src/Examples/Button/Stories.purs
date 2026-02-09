module Examples.Button.Stories where

import Data.Maybe (Maybe(..))
import React.Basic (JSX)
import Examples.Button (Variant(..), mkButton)
import YogaStories.Leva.Controls (enum)
import YogaStories.Story (story)

primary :: JSX
primary = story "primary" mkButton
  { label: "Submit"
  , variant: enum Primary
  , subtitle: Just "Click to submit the form"
  }

danger :: JSX
danger = story "danger" mkButton
  { label: "Delete"
  , variant: enum Danger
  , subtitle: Nothing :: Maybe String
  }

secondary :: JSX
secondary = story "secondary" mkButton
  { label: "Cancel"
  , variant: enum Secondary
  , subtitle: Just "Go back to previous page"
  }
