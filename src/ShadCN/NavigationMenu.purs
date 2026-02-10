module ShadCN.NavigationMenu where

import React.Basic (JSX)

foreign import navigationMenuImpl :: forall r. Record r -> JSX
foreign import navigationMenuListImpl :: forall r. Record r -> JSX
foreign import navigationMenuItemImpl :: forall r. Record r -> JSX
foreign import navigationMenuTriggerImpl :: forall r. Record r -> JSX
foreign import navigationMenuContentImpl :: forall r. Record r -> JSX
foreign import navigationMenuLinkImpl :: forall r. Record r -> JSX

navigationMenu :: { children :: Array JSX } -> JSX
navigationMenu props = navigationMenuImpl props

navigationMenuList :: { children :: Array JSX } -> JSX
navigationMenuList props = navigationMenuListImpl props

navigationMenuItem :: { children :: Array JSX } -> JSX
navigationMenuItem props = navigationMenuItemImpl props

navigationMenuTrigger :: { children :: Array JSX } -> JSX
navigationMenuTrigger props = navigationMenuTriggerImpl props

navigationMenuContent :: { children :: Array JSX } -> JSX
navigationMenuContent props = navigationMenuContentImpl props

navigationMenuLink :: { children :: Array JSX } -> JSX
navigationMenuLink props = navigationMenuLinkImpl props
