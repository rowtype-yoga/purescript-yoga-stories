module ShadCN.Textarea where

import React.Basic (JSX)

foreign import textareaImpl :: forall r. Record r -> JSX

textarea :: { placeholder :: String, disabled :: Boolean } -> JSX
textarea props =
  textareaImpl { placeholder: props.placeholder, disabled: props.disabled }
