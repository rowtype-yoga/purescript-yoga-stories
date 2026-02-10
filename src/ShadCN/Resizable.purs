module ShadCN.Resizable where

import React.Basic (JSX, ReactComponent)
import Yoga.React.DOM.Internal (class IsJSX, createElement)

foreign import resizablePanelGroup_ :: forall r. ReactComponent { | r }
foreign import resizablePanel_ :: forall r. ReactComponent { | r }
foreign import resizableHandle_ :: forall r. ReactComponent { | r }

resizablePanelGroup :: forall kids. IsJSX kids => String -> kids -> JSX
resizablePanelGroup direction = createElement resizablePanelGroup_ { className: "flex h-full w-full data-[panel-group-direction=vertical]:flex-col", direction }

resizablePanel :: forall kids. IsJSX kids => kids -> JSX
resizablePanel = createElement resizablePanel_ {}

resizableHandle :: JSX
resizableHandle = createElement resizableHandle_ { className: "bg-border relative flex w-px items-center justify-center" } ([] :: Array JSX)
