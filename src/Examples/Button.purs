module Examples.Button where

import Prelude

import Data.Generic.Rep (class Generic)
import Data.Maybe (Maybe(..))
import React.Basic (JSX)
import React.Basic.DOM as R
import Yoga.React (component)
import Yoga.React.DOM.HTML (button)
import Yoga.React.DOM.Internal (text)

data Variant = Primary | Secondary | Danger

derive instance Generic Variant _
derive instance Eq Variant

type Props =
  { label :: String
  , variant :: Variant
  , subtitle :: Maybe String
  }

mkButton :: Props -> JSX
mkButton = component "Button" \props -> React.do
  pure $ R.div_
    [ button { className: classes props.variant }
        (text props.label)
    , case props.subtitle of
        Nothing -> R.text ""
        Just sub -> R.div { className: "text-sm text-slate-500 mt-1", children: [ R.text sub ] }
    ]
  where
  classes Primary = "px-4 py-2 bg-indigo-600 text-white rounded-md font-medium hover:bg-indigo-500"
  classes Danger = "px-4 py-2 bg-red-600 text-white rounded-md font-medium hover:bg-red-500"
  classes Secondary = "px-4 py-2 bg-slate-700 text-slate-200 rounded-md font-medium hover:bg-slate-600"
