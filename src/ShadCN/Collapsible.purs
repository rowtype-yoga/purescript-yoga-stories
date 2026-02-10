module ShadCN.Collapsible where

import React.Basic (JSX, element)
import ShadCN.Radix as Radix

collapsible :: Array JSX -> JSX
collapsible kids = element Radix.collapsibleRoot { children: kids }

collapsibleTrigger :: Array JSX -> JSX
collapsibleTrigger kids = element Radix.collapsibleTrigger { children: kids }

collapsibleContent :: Array JSX -> JSX
collapsibleContent kids = element Radix.collapsibleContent { children: kids }
