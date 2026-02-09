module YogaStories.Story where

import Prelude

import Prim.RowList (class RowToList)
import React.Basic (JSX)
import React.Basic.Hooks as React
import Yoga.React (component)
import YogaStories.Leva (useControls)
import YogaStories.Leva.Schema (class WriteSchemaFields, class SchemaToProps, class ReadProps)

story
  :: forall schema rl props to propsTo
   . RowToList schema rl
  => WriteSchemaFields rl schema () to
  => SchemaToProps rl props
  => ReadProps rl schema () propsTo
  => String
  -> (Record propsTo -> JSX)
  -> Record schema
  -> JSX
story name comp schema = storyRenderer { name, component: comp, schema }
  where
  storyRenderer = component "StoryRenderer" \props -> React.do
    controls <- useControls props.name props.schema
    pure $ props.component controls
