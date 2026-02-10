module YogaStories.Story where

import Prelude

import Data.Maybe (Maybe(..), fromMaybe)
import Data.Tuple.Nested ((/\))
import Foreign.Object as Object
import Prim.RowList (class RowToList)
import React.Basic (JSX)
import React.Basic.Hooks as React
import React.Basic.DOM as R
import Type.Proxy (Proxy(..))
import Yoga.JSON (readJSON_, writeJSON)
import Yoga.React (component)
import YogaStories.Controls (class FromParams, class InitialValues, class RenderControls, class ToParams, buildInitialValues, controlsPanel, paramsToValues, renderControls, valuesToParams)
import YogaStories.UI.Hash (useHashParams)

story
  :: forall schema rl to
   . RowToList schema rl
  => InitialValues rl schema () to
  => RenderControls rl schema to
  => ToParams rl schema to
  => FromParams rl schema to
  => String
  -> (Record to -> JSX)
  -> Record schema
  -> JSX
story name comp schema = storyRenderer { name, component: comp, schema }
  where
  storyRenderer = component "StoryRenderer" \props -> React.do
    propsJson /\ setPropsJson <- useHashParams
    let defaults = buildInitialValues props.schema
    let
      initial = case propsJson of
        Just json -> paramsToValues props.schema (readJSON_ json # fromMaybe Object.empty) defaults
        _ -> defaults
    values /\ setValues <- React.useState' initial
    let
      updateValues newValues = do
        setValues newValues
        setPropsJson (writeJSON (valuesToParams props.schema newValues))
    let controls = renderControls (Proxy :: Proxy rl) props.schema values updateValues
    pure $ R.div_
      [ R.div { className: "ys-preview", children: [ props.component values ] }
      , R.div { className: "ys-controls", children: [ controlsPanel controls ] }
      ]
