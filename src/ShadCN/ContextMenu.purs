module ShadCN.ContextMenu where

import React.Basic (JSX)

foreign import contextMenuImpl :: forall r. Record r -> JSX
foreign import contextMenuTriggerImpl :: forall r. Record r -> JSX
foreign import contextMenuContentImpl :: forall r. Record r -> JSX
foreign import contextMenuItemImpl :: forall r. Record r -> JSX
foreign import contextMenuSeparatorImpl :: forall r. Record r -> JSX
foreign import contextMenuLabelImpl :: forall r. Record r -> JSX

contextMenu :: Array JSX -> JSX
contextMenu kids = contextMenuImpl { children: kids }

contextMenuTrigger :: Array JSX -> JSX
contextMenuTrigger kids = contextMenuTriggerImpl { children: kids }

contextMenuContent :: Array JSX -> JSX
contextMenuContent kids = contextMenuContentImpl { children: kids }

contextMenuItem :: Array JSX -> JSX
contextMenuItem kids = contextMenuItemImpl { children: kids }

contextMenuSeparator :: {} -> JSX
contextMenuSeparator props = contextMenuSeparatorImpl props

contextMenuLabel :: Array JSX -> JSX
contextMenuLabel kids = contextMenuLabelImpl { children: kids }
