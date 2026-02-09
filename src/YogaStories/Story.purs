module YogaStories.Story where

import Prelude

import React.Basic (JSX)
import React.Basic.Hooks as React
import Yoga.React (component)
import YogaStories.Leva (useControls)

story :: forall r. String -> (Record r -> JSX) -> Record r -> JSX
story name comp defaults = mkStoryRenderer { name, component: comp, defaults }

mkStoryRenderer :: forall r. { name :: String, component :: Record r -> JSX, defaults :: Record r } -> JSX
mkStoryRenderer = component "StoryRenderer" \props -> React.do
  controls <- useControls props.name props.defaults
  pure $ props.component controls
