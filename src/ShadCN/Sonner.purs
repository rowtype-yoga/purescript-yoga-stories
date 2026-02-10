module ShadCN.Sonner where

import React.Basic (JSX)

foreign import sonnerImpl :: forall r. Record r -> JSX

sonner :: {} -> JSX
sonner props = sonnerImpl props
