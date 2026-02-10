module ShadCN.Checkbox where

import React.Basic (JSX, element)
import ShadCN.Radix as Radix

checkbox :: forall r. { | r } -> JSX
checkbox props = element Radix.checkboxRoot { className: "peer border-input dark:bg-input/30 data-[state=checked]:bg-primary data-[state=checked]:text-primary-foreground data-[state=checked]:border-primary focus-visible:border-ring focus-visible:ring-ring/50 size-4 shrink-0 rounded-[4px] border shadow-xs transition-shadow outline-none focus-visible:ring-[3px] disabled:cursor-not-allowed disabled:opacity-50", children: [ element Radix.checkboxIndicator { className: "grid place-content-center text-current transition-none" } ] }
