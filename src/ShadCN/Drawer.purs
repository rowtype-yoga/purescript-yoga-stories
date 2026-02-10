module ShadCN.Drawer where

import React.Basic (JSX)

foreign import drawerImpl :: forall r. Record r -> JSX
foreign import drawerTriggerImpl :: forall r. Record r -> JSX
foreign import drawerContentImpl :: forall r. Record r -> JSX
foreign import drawerHeaderImpl :: forall r. Record r -> JSX
foreign import drawerFooterImpl :: forall r. Record r -> JSX
foreign import drawerTitleImpl :: forall r. Record r -> JSX
foreign import drawerDescriptionImpl :: forall r. Record r -> JSX
foreign import drawerCloseImpl :: forall r. Record r -> JSX

drawer :: { children :: Array JSX } -> JSX
drawer props = drawerImpl props

drawerTrigger :: { children :: Array JSX } -> JSX
drawerTrigger props = drawerTriggerImpl props

drawerContent :: { children :: Array JSX } -> JSX
drawerContent props = drawerContentImpl props

drawerHeader :: { children :: Array JSX } -> JSX
drawerHeader props = drawerHeaderImpl props

drawerFooter :: { children :: Array JSX } -> JSX
drawerFooter props = drawerFooterImpl props

drawerTitle :: { children :: Array JSX } -> JSX
drawerTitle props = drawerTitleImpl props

drawerDescription :: { children :: Array JSX } -> JSX
drawerDescription props = drawerDescriptionImpl props

drawerClose :: { children :: Array JSX } -> JSX
drawerClose props = drawerCloseImpl props
