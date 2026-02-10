module ShadCN.Progress where

import React.Basic (JSX)

foreign import progressImpl :: forall r. Record r -> JSX

progress :: { value :: Number } -> JSX
progress props = progressImpl props
