module YogaStories.Story where

import Prelude

import Data.Maybe (Maybe(..), fromMaybe)
import Data.Tuple.Nested ((/\))
import Effect (Effect)
import Foreign.Object as Object
import Prim.RowList (class RowToList)
import React.Basic (JSX)
import React.Basic.Hooks as React
import React.Basic.Hooks.Internal (unsafeRenderEffect)
import React.Basic.DOM as R
import Type.Proxy (Proxy(..))
import Web.Event.Event (EventType(..))
import Web.Event.EventTarget (addEventListener, eventListener, removeEventListener)
import Web.HTML (window)
import Web.HTML.Window as Window
import Yoga.JSON (readJSON_, writeJSON)
import Yoga.React (component)
import YogaStories.Controls (class FromParams, class InitialValues, class RenderControls, class ToParams, buildInitialValues, controlsPanel, orderControls, paramsToValues, renderControls, valuesToParams)
import YogaStories.UI.Hash (readHashProps, writeHashProps)

-- | A story whose knobs render alphabetically by field name (PureScript's
-- | `RowToList` order). See `storyOrdered` to pin a custom knob order.
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
story = storyOrdered []

-- | Like `story`, but `order` pins the leading knobs by field name; unlisted
-- | fields trail in alphabetical order. This is the only way to escape the
-- | alphabetical default, since `RowToList` discards declaration order.
storyOrdered
  :: forall schema rl to
   . RowToList schema rl
  => InitialValues rl schema () to
  => RenderControls rl schema to
  => ToParams rl schema to
  => FromParams rl schema to
  => Array String
  -> String
  -> (Record to -> JSX)
  -> Record schema
  -> JSX
storyOrdered order name comp schema = storyRenderer { name, component: comp, schema }
  where
  storyRenderer = component "StoryRenderer" \props -> React.do
    let defaults = buildInitialValues props.schema
    let
      valuesFromHash :: Maybe String -> Record to
      valuesFromHash = case _ of
        Just json -> paramsToValues props.schema (readJSON_ json # fromMaybe Object.empty) defaults
        _ -> defaults
    propsJson <- unsafeRenderEffect readHashProps
    values /\ setValues <- React.useState' (valuesFromHash propsJson)
    React.useEffectOnce do
      onHashChange do
        hp <- readHashProps
        setValues (valuesFromHash hp)
    let
      updateValues newValues = do
        setValues newValues
        writeHashProps (writeJSON (valuesToParams props.schema newValues))
    let controls = orderControls order (renderControls (Proxy :: Proxy rl) props.schema values updateValues)
    pure $ R.div_
      [ R.div { className: "ys-preview", children: [ props.component values ] }
      , R.div { className: "ys-controls", children: [ controlsPanel controls ] }
      ]
  onHashChange :: Effect Unit -> Effect (Effect Unit)
  onHashChange cb = do
    w <- window
    listener <- eventListener \_ -> cb
    let target = Window.toEventTarget w
    addEventListener (EventType "hashchange") listener false target
    pure (removeEventListener (EventType "hashchange") listener false target)
