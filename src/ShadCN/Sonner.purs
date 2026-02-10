module ShadCN.Sonner where

import React.Basic (JSX, ReactComponent)
import Yoga.React.DOM.Internal (createElement)

foreign import toaster :: forall r. ReactComponent { | r }

sonner :: JSX
sonner = createElement toaster {} ([] :: Array JSX)
