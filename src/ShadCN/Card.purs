module ShadCN.Card where

import React.Basic (JSX)

foreign import cardImpl :: forall r. Record r -> JSX
foreign import cardHeaderImpl :: forall r. Record r -> JSX
foreign import cardTitleImpl :: forall r. Record r -> JSX
foreign import cardDescriptionImpl :: forall r. Record r -> JSX
foreign import cardContentImpl :: forall r. Record r -> JSX
foreign import cardFooterImpl :: forall r. Record r -> JSX

card :: { children :: Array JSX } -> JSX
card props = cardImpl { children: props.children }

cardHeader :: { children :: Array JSX } -> JSX
cardHeader props = cardHeaderImpl { children: props.children }

cardTitle :: { children :: Array JSX } -> JSX
cardTitle props = cardTitleImpl { children: props.children }

cardDescription :: { children :: Array JSX } -> JSX
cardDescription props = cardDescriptionImpl { children: props.children }

cardContent :: { children :: Array JSX } -> JSX
cardContent props = cardContentImpl { children: props.children }

cardFooter :: { children :: Array JSX } -> JSX
cardFooter props = cardFooterImpl { children: props.children }
