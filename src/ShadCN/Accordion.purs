module ShadCN.Accordion where

import React.Basic (JSX)

foreign import accordionImpl :: forall r. Record r -> JSX
foreign import accordionItemImpl :: forall r. Record r -> JSX
foreign import accordionTriggerImpl :: forall r. Record r -> JSX
foreign import accordionContentImpl :: forall r. Record r -> JSX

accordion :: { type :: String, collapsible :: Boolean } -> Array JSX -> JSX
accordion props kids = accordionImpl { type: props.type, collapsible: props.collapsible, children: kids }

accordionItem :: { value :: String } -> Array JSX -> JSX
accordionItem props kids = accordionItemImpl { value: props.value, children: kids }

accordionTrigger :: Array JSX -> JSX
accordionTrigger kids = accordionTriggerImpl { children: kids }

accordionContent :: Array JSX -> JSX
accordionContent kids = accordionContentImpl { children: kids }
