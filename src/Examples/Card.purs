module Examples.Card where

import Prelude hiding (div)

import React.Basic (JSX)
import Yoga.React (component)
import Yoga.React.DOM.HTML (div, h3, p)
import Yoga.React.DOM.Internal (text)

type Props =
  { content ::
      { title :: String
      , body :: String
      }
  , style ::
      { border ::
          { color :: String
          , visible :: Boolean
          }
      , background :: String
      , rounded :: Boolean
      }
  }

mkCard :: Props -> JSX
mkCard = component "Card" \props -> React.do
  let
    border = if props.style.border.visible then "border border-[" <> props.style.border.color <> "]" else ""
    rounding = if props.style.rounded then "rounded-lg" else ""
    bg = "bg-[" <> props.style.background <> "]"
    cls = rounding <> " " <> border <> " " <> bg <> " p-6"
  pure $
    div { className: cls }
      [ h3 { className: "text-lg font-semibold text-slate-100 mb-2" }
          (text props.content.title)
      , p { className: "text-sm text-slate-400 m-0" }
          (text props.content.body)
      ]
