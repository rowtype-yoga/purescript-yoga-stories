module ShadCN.RadioGroup where

import React.Basic (JSX)
import Yoga.React.DOM.Internal (class IsJSX, createElement)
import ShadCN.Radix as Radix

radioGroup :: forall kids. IsJSX kids => kids -> JSX
radioGroup = createElement Radix.radioGroupRoot { className: "grid gap-3" }

radioGroupItem :: String -> JSX
radioGroupItem value = createElement Radix.radioGroupItem { className: "border-input text-primary focus-visible:border-ring focus-visible:ring-ring/50 dark:bg-input/30 aspect-square size-4 shrink-0 rounded-full border shadow-xs transition-[color,box-shadow] outline-none focus-visible:ring-[3px] disabled:cursor-not-allowed disabled:opacity-50", value }
  [ createElement Radix.radioGroupIndicator { className: "relative flex items-center justify-center" } ([] :: Array JSX) ]
