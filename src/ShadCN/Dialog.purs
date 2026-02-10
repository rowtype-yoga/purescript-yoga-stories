module ShadCN.Dialog where

import React.Basic (JSX)

foreign import dialogImpl :: forall r. Record r -> JSX
foreign import dialogTriggerImpl :: forall r. Record r -> JSX
foreign import dialogContentImpl :: forall r. Record r -> JSX
foreign import dialogHeaderImpl :: forall r. Record r -> JSX
foreign import dialogFooterImpl :: forall r. Record r -> JSX
foreign import dialogTitleImpl :: forall r. Record r -> JSX
foreign import dialogDescriptionImpl :: forall r. Record r -> JSX
foreign import dialogCloseImpl :: forall r. Record r -> JSX

dialog :: Array JSX -> JSX
dialog kids = dialogImpl { children: kids }

dialogTrigger :: Array JSX -> JSX
dialogTrigger kids = dialogTriggerImpl { children: kids }

dialogContent :: Array JSX -> JSX
dialogContent kids = dialogContentImpl { children: kids }

dialogHeader :: Array JSX -> JSX
dialogHeader kids = dialogHeaderImpl { children: kids }

dialogFooter :: Array JSX -> JSX
dialogFooter kids = dialogFooterImpl { children: kids }

dialogTitle :: Array JSX -> JSX
dialogTitle kids = dialogTitleImpl { children: kids }

dialogDescription :: Array JSX -> JSX
dialogDescription kids = dialogDescriptionImpl { children: kids }

dialogClose :: Array JSX -> JSX
dialogClose kids = dialogCloseImpl { children: kids }
