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

dialog :: { children :: Array JSX } -> JSX
dialog props = dialogImpl props

dialogTrigger :: { children :: Array JSX } -> JSX
dialogTrigger props = dialogTriggerImpl props

dialogContent :: { children :: Array JSX } -> JSX
dialogContent props = dialogContentImpl props

dialogHeader :: { children :: Array JSX } -> JSX
dialogHeader props = dialogHeaderImpl props

dialogFooter :: { children :: Array JSX } -> JSX
dialogFooter props = dialogFooterImpl props

dialogTitle :: { children :: Array JSX } -> JSX
dialogTitle props = dialogTitleImpl props

dialogDescription :: { children :: Array JSX } -> JSX
dialogDescription props = dialogDescriptionImpl props

dialogClose :: { children :: Array JSX } -> JSX
dialogClose props = dialogCloseImpl props
