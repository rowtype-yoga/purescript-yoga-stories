module ShadCN.Resizable where

import React.Basic (JSX)

foreign import resizablePanelGroupImpl :: forall r. Record r -> JSX
foreign import resizablePanelImpl :: forall r. Record r -> JSX
foreign import resizableHandleImpl :: forall r. Record r -> JSX

resizablePanelGroup :: String -> Array JSX -> JSX
resizablePanelGroup direction kids = resizablePanelGroupImpl { direction, children: kids }

resizablePanel :: Array JSX -> JSX
resizablePanel kids = resizablePanelImpl { children: kids }

resizableHandle :: {} -> JSX
resizableHandle props = resizableHandleImpl props
