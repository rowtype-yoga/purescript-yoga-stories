module ShadCN.Switch where

import React.Basic (JSX)

foreign import switchImpl :: forall r. Record r -> JSX

switch :: {} -> JSX
switch props = switchImpl props
