module ShadCN.Menubar where

import React.Basic (JSX)

foreign import menubarImpl :: forall r. Record r -> JSX
foreign import menubarMenuImpl :: forall r. Record r -> JSX
foreign import menubarTriggerImpl :: forall r. Record r -> JSX
foreign import menubarContentImpl :: forall r. Record r -> JSX
foreign import menubarItemImpl :: forall r. Record r -> JSX
foreign import menubarSeparatorImpl :: forall r. Record r -> JSX

menubar :: { children :: Array JSX } -> JSX
menubar props = menubarImpl props

menubarMenu :: { children :: Array JSX } -> JSX
menubarMenu props = menubarMenuImpl props

menubarTrigger :: { children :: Array JSX } -> JSX
menubarTrigger props = menubarTriggerImpl props

menubarContent :: { children :: Array JSX } -> JSX
menubarContent props = menubarContentImpl props

menubarItem :: { children :: Array JSX } -> JSX
menubarItem props = menubarItemImpl props

menubarSeparator :: {} -> JSX
menubarSeparator props = menubarSeparatorImpl props
