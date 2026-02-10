module ShadCN.ContextMenu where

import React.Basic (JSX)

foreign import contextMenuImpl :: forall r. Record r -> JSX
foreign import contextMenuTriggerImpl :: forall r. Record r -> JSX
foreign import contextMenuContentImpl :: forall r. Record r -> JSX
foreign import contextMenuItemImpl :: forall r. Record r -> JSX
foreign import contextMenuSeparatorImpl :: forall r. Record r -> JSX
foreign import contextMenuLabelImpl :: forall r. Record r -> JSX

contextMenu :: { children :: Array JSX } -> JSX
contextMenu props = contextMenuImpl props

contextMenuTrigger :: { children :: Array JSX } -> JSX
contextMenuTrigger props = contextMenuTriggerImpl props

contextMenuContent :: { children :: Array JSX } -> JSX
contextMenuContent props = contextMenuContentImpl props

contextMenuItem :: { children :: Array JSX } -> JSX
contextMenuItem props = contextMenuItemImpl props

contextMenuSeparator :: {} -> JSX
contextMenuSeparator props = contextMenuSeparatorImpl props

contextMenuLabel :: { children :: Array JSX } -> JSX
contextMenuLabel props = contextMenuLabelImpl props
