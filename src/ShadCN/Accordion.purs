module ShadCN.Accordion where

import React.Basic (JSX)

foreign import accordionImpl :: forall r. Record r -> JSX
foreign import accordionItemImpl :: forall r. Record r -> JSX
foreign import accordionTriggerImpl :: forall r. Record r -> JSX
foreign import accordionContentImpl :: forall r. Record r -> JSX

accordion :: { type :: String, collapsible :: Boolean, children :: Array JSX } -> JSX
accordion props = accordionImpl props

accordionItem :: { value :: String, children :: Array JSX } -> JSX
accordionItem props = accordionItemImpl props

accordionTrigger :: { children :: Array JSX } -> JSX
accordionTrigger props = accordionTriggerImpl props

accordionContent :: { children :: Array JSX } -> JSX
accordionContent props = accordionContentImpl props
