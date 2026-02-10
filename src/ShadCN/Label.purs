module ShadCN.Label where

import React.Basic (JSX, element)
import ShadCN.Radix as Radix

label :: Array JSX -> JSX
label kids = element Radix.labelRoot { className: "flex items-center gap-2 text-sm leading-none font-medium select-none group-data-[disabled=true]:pointer-events-none group-data-[disabled=true]:opacity-50 peer-disabled:cursor-not-allowed peer-disabled:opacity-50", children: kids }
