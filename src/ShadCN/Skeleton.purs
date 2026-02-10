module ShadCN.Skeleton where

import React.Basic (JSX)

foreign import skeletonImpl :: forall r. Record r -> JSX

skeleton :: { style :: { width :: String, height :: String } } -> JSX
skeleton props =
  skeletonImpl { style: props.style }
