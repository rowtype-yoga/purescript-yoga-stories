module ShadCN.Spinner where

import React.Basic (JSX)

foreign import spinnerImpl :: forall r. Record r -> JSX

spinner :: JSX
spinner = spinnerImpl {}
