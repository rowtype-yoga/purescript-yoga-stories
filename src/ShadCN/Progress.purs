module ShadCN.Progress where

import Prelude
import React.Basic (JSX)
import Yoga.React.DOM.Internal (createElement)
import ShadCN.Radix as Radix

progress :: Number -> JSX
progress value = createElement Radix.progressRoot { className: "bg-primary/20 relative h-2 w-full overflow-hidden rounded-full", value }
  [ createElement Radix.progressIndicator { className: "bg-primary h-full w-full flex-1 transition-all", style: { transform: "translateX(-" <> show (100.0 - value) <> "%)" } } ([] :: Array JSX) ]
