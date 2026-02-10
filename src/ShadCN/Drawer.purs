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

drawer :: Array JSX -> JSX
drawer kids = drawerImpl { children: kids }

drawerTrigger :: Array JSX -> JSX
drawerTrigger kids = drawerTriggerImpl { children: kids }

drawerContent :: Array JSX -> JSX
drawerContent kids = drawerContentImpl { children: kids }

drawerHeader :: Array JSX -> JSX
drawerHeader kids = drawerHeaderImpl { children: kids }

drawerFooter :: Array JSX -> JSX
drawerFooter kids = drawerFooterImpl { children: kids }

drawerTitle :: Array JSX -> JSX
drawerTitle kids = drawerTitleImpl { children: kids }

drawerDescription :: Array JSX -> JSX
drawerDescription kids = drawerDescriptionImpl { children: kids }

drawerClose :: Array JSX -> JSX
drawerClose kids = drawerCloseImpl { children: kids }
