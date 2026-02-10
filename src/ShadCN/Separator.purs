module ShadCN.Separator where

import React.Basic (JSX)

foreign import separatorImpl :: forall r. Record r -> JSX

separator :: { orientation :: String, decorative :: Boolean } -> JSX
separator props = separatorImpl props

separatorHorizontal :: JSX
separatorHorizontal = separatorImpl { orientation: "horizontal", decorative: true }

separatorVertical :: JSX
separatorVertical = separatorImpl { orientation: "vertical", decorative: true }
