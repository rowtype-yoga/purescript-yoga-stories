module ShadCN.Resizable where

import React.Basic (JSX)

foreign import resizablePanelGroupImpl :: forall r. Record r -> JSX
foreign import resizablePanelImpl :: forall r. Record r -> JSX
foreign import resizableHandleImpl :: forall r. Record r -> JSX

resizablePanelGroup :: { direction :: String, children :: Array JSX } -> JSX
resizablePanelGroup props = resizablePanelGroupImpl props

resizablePanel :: { children :: Array JSX } -> JSX
resizablePanel props = resizablePanelImpl props

resizableHandle :: {} -> JSX
resizableHandle props = resizableHandleImpl props
