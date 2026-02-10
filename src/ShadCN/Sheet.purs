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

sheet :: Array JSX -> JSX
sheet kids = sheetImpl { children: kids }

sheetTrigger :: Array JSX -> JSX
sheetTrigger kids = sheetTriggerImpl { children: kids }

sheetContent :: String -> Array JSX -> JSX
sheetContent side kids = sheetContentImpl { side, children: kids }

sheetHeader :: Array JSX -> JSX
sheetHeader kids = sheetHeaderImpl { children: kids }

sheetFooter :: Array JSX -> JSX
sheetFooter kids = sheetFooterImpl { children: kids }

sheetTitle :: Array JSX -> JSX
sheetTitle kids = sheetTitleImpl { children: kids }

sheetDescription :: Array JSX -> JSX
sheetDescription kids = sheetDescriptionImpl { children: kids }

sheetClose :: Array JSX -> JSX
sheetClose kids = sheetCloseImpl { children: kids }
