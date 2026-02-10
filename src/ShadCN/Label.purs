module ShadCN.Label where

import React.Basic (JSX)

foreign import labelImpl :: forall r. Record r -> JSX

label :: Array JSX -> JSX
label kids = labelImpl { children: kids }
