module ShadCN.Collapsible where

import React.Basic (JSX)
import Yoga.React.DOM.Internal (class IsJSX, createElement)
import ShadCN.Radix as Radix

collapsible :: forall kids. IsJSX kids => kids -> JSX
collapsible = createElement Radix.collapsibleRoot {}

collapsibleTrigger :: forall kids. IsJSX kids => kids -> JSX
collapsibleTrigger = createElement Radix.collapsibleTrigger {}

collapsibleContent :: forall kids. IsJSX kids => kids -> JSX
collapsibleContent = createElement Radix.collapsibleContent {}
