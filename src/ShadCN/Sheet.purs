module ShadCN.Sheet where

import React.Basic (JSX)

foreign import sheetImpl :: forall r. Record r -> JSX
foreign import sheetTriggerImpl :: forall r. Record r -> JSX
foreign import sheetContentImpl :: forall r. Record r -> JSX
foreign import sheetHeaderImpl :: forall r. Record r -> JSX
foreign import sheetFooterImpl :: forall r. Record r -> JSX
foreign import sheetTitleImpl :: forall r. Record r -> JSX
foreign import sheetDescriptionImpl :: forall r. Record r -> JSX
foreign import sheetCloseImpl :: forall r. Record r -> JSX

sheet :: { children :: Array JSX } -> JSX
sheet props = sheetImpl props

sheetTrigger :: { children :: Array JSX } -> JSX
sheetTrigger props = sheetTriggerImpl props

sheetContent :: { side :: String, children :: Array JSX } -> JSX
sheetContent props = sheetContentImpl props

sheetHeader :: { children :: Array JSX } -> JSX
sheetHeader props = sheetHeaderImpl props

sheetFooter :: { children :: Array JSX } -> JSX
sheetFooter props = sheetFooterImpl props

sheetTitle :: { children :: Array JSX } -> JSX
sheetTitle props = sheetTitleImpl props

sheetDescription :: { children :: Array JSX } -> JSX
sheetDescription props = sheetDescriptionImpl props

sheetClose :: { children :: Array JSX } -> JSX
sheetClose props = sheetCloseImpl props
