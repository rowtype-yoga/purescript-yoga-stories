module Examples.Progress.Stories where

import React.Basic (JSX)
import Examples.Progress (mkProgress)
import YogaStories.Story (story)
import YogaStories.Controls (slider, select)

demo :: JSX
demo = story "demo" mkProgress
  { label: "Upload"
  , value: slider { value: 0.65, min: 0.0, max: 1.0, step: 0.01 }
  , color: select "#6366f1" [ "#6366f1", "#22c55e", "#ef4444", "#f59e0b" ]
  }
