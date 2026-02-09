module Examples.Progress where

import Prelude hiding (div)

import React.Basic (JSX)
import Yoga.React (component)
import Yoga.React.DOM.HTML (div, span)
import Yoga.React.DOM.Internal (css, text)

type Props = { label :: String, value :: Number, color :: String }

mkProgress :: Props -> JSX
mkProgress = component "Progress" \props -> React.do
  pure $
    div { className: "w-full" }
      [ div { className: "flex justify-between mb-1" }
          [ span { className: "text-sm text-slate-300" } (text props.label)
          , span { className: "text-sm text-slate-400" } (text (show (props.value * 100.0) <> "%"))
          ]
      , div { className: "w-full bg-slate-700 rounded-full h-3" }
          [ div
              { className: "h-3 rounded-full transition-all"
              , style: css { width: show (props.value * 100.0) <> "%", backgroundColor: props.color }
              }
              (text "")
          ]
      ]
