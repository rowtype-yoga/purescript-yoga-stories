module ShadCN.Accordion where

import React.Basic (JSX)
import Yoga.React.DOM.Internal (class IsJSX, createElement)
import ShadCN.Radix as Radix

accordion :: forall kids. IsJSX kids => { type :: String, collapsible :: Boolean } -> kids -> JSX
accordion props = createElement Radix.accordionRoot { type: props.type, collapsible: props.collapsible }

accordionItem :: forall kids. IsJSX kids => String -> kids -> JSX
accordionItem value = createElement Radix.accordionItem { value, className: "border-b last:border-b-0" }

accordionTrigger :: forall kids. IsJSX kids => kids -> JSX
accordionTrigger kids = createElement Radix.accordionHeader { className: "flex" }
  [ createElement Radix.accordionTrigger { className: "flex flex-1 items-start justify-between gap-4 rounded-md py-4 text-left text-sm font-medium transition-all outline-none hover:underline [&[data-state=open]>svg]:rotate-180" } kids ]

accordionContent :: forall kids. IsJSX kids => kids -> JSX
accordionContent = createElement Radix.accordionContent { className: "data-[state=closed]:animate-accordion-up data-[state=open]:animate-accordion-down overflow-hidden text-sm" }
