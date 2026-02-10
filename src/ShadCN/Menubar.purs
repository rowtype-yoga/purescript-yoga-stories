module ShadCN.Menubar where

import React.Basic (JSX)

foreign import menubarImpl :: forall r. Record r -> JSX
foreign import menubarMenuImpl :: forall r. Record r -> JSX
foreign import menubarTriggerImpl :: forall r. Record r -> JSX
foreign import menubarContentImpl :: forall r. Record r -> JSX
foreign import menubarItemImpl :: forall r. Record r -> JSX
foreign import menubarSeparatorImpl :: forall r. Record r -> JSX

menubar :: Array JSX -> JSX
menubar kids = menubarImpl { children: kids }

menubarMenu :: Array JSX -> JSX
menubarMenu kids = menubarMenuImpl { children: kids }

menubarTrigger :: Array JSX -> JSX
menubarTrigger kids = menubarTriggerImpl { children: kids }

menubarContent :: Array JSX -> JSX
menubarContent kids = menubarContentImpl { children: kids }

menubarItem :: Array JSX -> JSX
menubarItem kids = menubarItemImpl { children: kids }

menubarSeparator :: {} -> JSX
menubarSeparator props = menubarSeparatorImpl props
