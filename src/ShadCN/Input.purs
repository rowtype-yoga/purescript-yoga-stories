module ShadCN.Input where

import React.Basic (JSX)

foreign import inputImpl :: forall r. Record r -> JSX

input :: { placeholder :: String, disabled :: Boolean } -> JSX
input props =
  inputImpl { placeholder: props.placeholder, disabled: props.disabled }
