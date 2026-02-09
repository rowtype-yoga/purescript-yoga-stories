module Examples.Button.Stories where

import Prelude

import Data.Maybe (Maybe(..))
import React.Basic (JSX)
import Examples.Button (mkButton)
import YogaStories.Story (story)

primary :: JSX
primary = story "primary" mkButton
  { label: "Submit"
  , variant: "primary"
  , subtitle: Just "Click to submit the form"
  }

danger :: JSX
danger = story "danger" mkButton
  { label: "Delete"
  , variant: "danger"
  , subtitle: Nothing :: Maybe String
  }

secondary :: JSX
secondary = story "secondary" mkButton
  { label: "Cancel"
  , variant: "secondary"
  , subtitle: Just "Go back to previous page"
  }
