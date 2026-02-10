module ShadCN.Chart where

import React.Basic (JSX)

foreign import chartContainerImpl :: forall r. Record r -> JSX

chartContainer :: { children :: Array JSX } -> JSX
chartContainer props = chartContainerImpl props
