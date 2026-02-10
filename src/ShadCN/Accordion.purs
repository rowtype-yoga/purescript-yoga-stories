module ShadCN.Accordion where

import React.Basic (JSX, element)
import ShadCN.Radix as Radix

accordion :: { type :: String, collapsible :: Boolean } -> Array JSX -> JSX
accordion props kids = element Radix.accordionRoot { type: props.type, collapsible: props.collapsible, children: kids }

accordionItem :: String -> Array JSX -> JSX
accordionItem value kids = element Radix.accordionItem { value, className: "border-b last:border-b-0", children: kids }

accordionTrigger :: Array JSX -> JSX
accordionTrigger kids = element Radix.accordionHeader { className: "flex", children:
  [ element Radix.accordionTrigger { className: "flex flex-1 items-start justify-between gap-4 rounded-md py-4 text-left text-sm font-medium transition-all outline-none hover:underline [&[data-state=open]>svg]:rotate-180", children: kids } ] }

accordionContent :: Array JSX -> JSX
accordionContent kids = element Radix.accordionContent { className: "data-[state=closed]:animate-accordion-up data-[state=open]:animate-accordion-down overflow-hidden text-sm", children: kids }
