module ShadCN.NativeSelect where

import React.Basic (JSX)

foreign import nativeSelectImpl :: forall r. Record r -> JSX

nativeSelect :: { children :: Array JSX } -> JSX
nativeSelect props = nativeSelectImpl props
