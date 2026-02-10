module ShadCN.Progress where

import Prelude
import React.Basic (JSX, element)
import ShadCN.Radix as Radix

progress :: Number -> JSX
progress value = element Radix.progressRoot { className: "bg-primary/20 relative h-2 w-full overflow-hidden rounded-full", value, children:
  [ element Radix.progressIndicator { className: "bg-primary h-full w-full flex-1 transition-all", style: { transform: "translateX(-" <> show (100.0 - value) <> "%)" } } ] }
