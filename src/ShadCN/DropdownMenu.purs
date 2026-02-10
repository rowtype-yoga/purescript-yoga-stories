module ShadCN.DropdownMenu where

import React.Basic (JSX)

foreign import dropdownMenuImpl :: forall r. Record r -> JSX
foreign import dropdownMenuTriggerImpl :: forall r. Record r -> JSX
foreign import dropdownMenuContentImpl :: forall r. Record r -> JSX
foreign import dropdownMenuItemImpl :: forall r. Record r -> JSX
foreign import dropdownMenuSeparatorImpl :: forall r. Record r -> JSX
foreign import dropdownMenuLabelImpl :: forall r. Record r -> JSX

dropdownMenu :: Array JSX -> JSX
dropdownMenu kids = dropdownMenuImpl { children: kids }

dropdownMenuTrigger :: Array JSX -> JSX
dropdownMenuTrigger kids = dropdownMenuTriggerImpl { children: kids }

dropdownMenuContent :: Array JSX -> JSX
dropdownMenuContent kids = dropdownMenuContentImpl { children: kids }

dropdownMenuItem :: Array JSX -> JSX
dropdownMenuItem kids = dropdownMenuItemImpl { children: kids }

dropdownMenuSeparator :: JSX
dropdownMenuSeparator = dropdownMenuSeparatorImpl {}

dropdownMenuLabel :: Array JSX -> JSX
dropdownMenuLabel kids = dropdownMenuLabelImpl { children: kids }
