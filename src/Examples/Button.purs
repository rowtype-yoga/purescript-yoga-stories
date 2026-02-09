module Examples.Button where

import Prelude

import React.Basic (JSX)
import Yoga.React (component)
import Yoga.React.DOM.HTML (button)
import Yoga.React.DOM.Internal (text)

type Props =
  { label :: String
  , variant :: String
  }

mkButton :: Props -> JSX
mkButton = component "Button" \props -> React.do
  pure $ button { className: classes props.variant }
    (text props.label)
  where
  classes "primary" = "px-4 py-2 bg-indigo-600 text-white rounded-md font-medium hover:bg-indigo-500"
  classes "danger" = "px-4 py-2 bg-red-600 text-white rounded-md font-medium hover:bg-red-500"
  classes _ = "px-4 py-2 bg-slate-700 text-slate-200 rounded-md font-medium hover:bg-slate-600"
