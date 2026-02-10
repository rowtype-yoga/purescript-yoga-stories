module ShadCN.DropdownMenu where

import React.Basic (JSX)

foreign import dropdownMenuImpl :: forall r. Record r -> JSX
foreign import dropdownMenuTriggerImpl :: forall r. Record r -> JSX
foreign import dropdownMenuContentImpl :: forall r. Record r -> JSX
foreign import dropdownMenuItemImpl :: forall r. Record r -> JSX
foreign import dropdownMenuSeparatorImpl :: forall r. Record r -> JSX
foreign import dropdownMenuLabelImpl :: forall r. Record r -> JSX

dropdownMenu :: { children :: Array JSX } -> JSX
dropdownMenu props = dropdownMenuImpl props

dropdownMenuTrigger :: { children :: Array JSX } -> JSX
dropdownMenuTrigger props = dropdownMenuTriggerImpl props

dropdownMenuContent :: { children :: Array JSX } -> JSX
dropdownMenuContent props = dropdownMenuContentImpl props

dropdownMenuItem :: { children :: Array JSX } -> JSX
dropdownMenuItem props = dropdownMenuItemImpl props

dropdownMenuSeparator :: JSX
dropdownMenuSeparator = dropdownMenuSeparatorImpl {}

dropdownMenuLabel :: { children :: Array JSX } -> JSX
dropdownMenuLabel props = dropdownMenuLabelImpl props
