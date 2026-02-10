module ShadCN.RadioGroup where

import React.Basic (JSX, element)
import ShadCN.Radix as Radix

radioGroup :: Array JSX -> JSX
radioGroup kids = element Radix.radioGroupRoot { className: "grid gap-3", children: kids }

radioGroupItem :: String -> JSX
radioGroupItem value = element Radix.radioGroupItem { className: "border-input text-primary focus-visible:border-ring focus-visible:ring-ring/50 dark:bg-input/30 aspect-square size-4 shrink-0 rounded-full border shadow-xs transition-[color,box-shadow] outline-none focus-visible:ring-[3px] disabled:cursor-not-allowed disabled:opacity-50", value, children:
  [ element Radix.radioGroupIndicator { className: "relative flex items-center justify-center" } ] }
