module Examples.Card where

import Prelude hiding (div)

import React.Basic (JSX)
import Yoga.React (component)
import Yoga.React.DOM.HTML (div, h3, p)
import Yoga.React.DOM.Internal (text)

type Props =
  { title :: String
  , body :: String
  }

mkCard :: Props -> JSX
mkCard = component "Card" \props -> React.do
  pure $
    div { className: "rounded-lg border border-slate-700 bg-slate-800 p-6" }
      [ h3 { className: "text-lg font-semibold text-slate-100 mb-2" }
          (text props.title)
      , p { className: "text-sm text-slate-400 m-0" }
          (text props.body)
      ]
