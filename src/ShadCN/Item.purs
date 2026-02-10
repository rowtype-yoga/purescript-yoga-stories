module ShadCN.Item where

import React.Basic (JSX)

foreign import itemImpl :: forall r. Record r -> JSX
foreign import itemGroupImpl :: forall r. Record r -> JSX
foreign import itemMediaImpl :: forall r. Record r -> JSX
foreign import itemContentImpl :: forall r. Record r -> JSX
foreign import itemTitleImpl :: forall r. Record r -> JSX
foreign import itemDescriptionImpl :: forall r. Record r -> JSX
foreign import itemActionsImpl :: forall r. Record r -> JSX

item :: { children :: Array JSX } -> JSX
item props = itemImpl props

itemGroup :: { children :: Array JSX } -> JSX
itemGroup props = itemGroupImpl props

itemMedia :: { children :: Array JSX } -> JSX
itemMedia props = itemMediaImpl props

itemContent :: { children :: Array JSX } -> JSX
itemContent props = itemContentImpl props

itemTitle :: { children :: Array JSX } -> JSX
itemTitle props = itemTitleImpl props

itemDescription :: { children :: Array JSX } -> JSX
itemDescription props = itemDescriptionImpl props

itemActions :: { children :: Array JSX } -> JSX
itemActions props = itemActionsImpl props
