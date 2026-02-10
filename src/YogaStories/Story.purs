module YogaStories.Story where

import Prelude

import Data.Tuple.Nested ((/\))
import Prim.RowList (class RowToList)
import React.Basic (JSX)
import React.Basic.Hooks as React
import Type.Proxy (Proxy(..))
import React.Basic.DOM as R
import Yoga.React (component)
import YogaStories.Controls (class InitialValues, class RenderControls, buildInitialValues, controlsPanel, renderControls)

story
  :: forall schema rl values to
   . RowToList schema rl
  => InitialValues rl schema () to
  => RenderControls rl schema to
  => String
  -> (Record to -> JSX)
  -> Record schema
  -> JSX
story name comp schema = storyRenderer { name, component: comp, schema }
  where
  storyRenderer = component "StoryRenderer" \props -> React.do
    values /\ setValues <- React.useState' (buildInitialValues props.schema)
    let controls = renderControls (Proxy :: Proxy rl) props.schema values setValues
    pure $ R.div_
      [ R.div { className: "ys-preview", children: [ props.component values ] }
      , R.div { className: "ys-controls", children: [ controlsPanel controls ] }
      ]
