module ShadCN.NavigationMenu where

import React.Basic (JSX)

foreign import navigationMenuImpl :: forall r. Record r -> JSX
foreign import navigationMenuListImpl :: forall r. Record r -> JSX
foreign import navigationMenuItemImpl :: forall r. Record r -> JSX
foreign import navigationMenuTriggerImpl :: forall r. Record r -> JSX
foreign import navigationMenuContentImpl :: forall r. Record r -> JSX
foreign import navigationMenuLinkImpl :: forall r. Record r -> JSX

navigationMenu :: Array JSX -> JSX
navigationMenu kids = navigationMenuImpl { children: kids }

navigationMenuList :: Array JSX -> JSX
navigationMenuList kids = navigationMenuListImpl { children: kids }

navigationMenuItem :: Array JSX -> JSX
navigationMenuItem kids = navigationMenuItemImpl { children: kids }

navigationMenuTrigger :: Array JSX -> JSX
navigationMenuTrigger kids = navigationMenuTriggerImpl { children: kids }

navigationMenuContent :: Array JSX -> JSX
navigationMenuContent kids = navigationMenuContentImpl { children: kids }

navigationMenuLink :: Array JSX -> JSX
navigationMenuLink kids = navigationMenuLinkImpl { children: kids }
