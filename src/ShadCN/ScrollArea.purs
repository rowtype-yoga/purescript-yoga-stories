module ShadCN.ScrollArea where

import React.Basic (JSX)

foreign import scrollAreaImpl :: forall r. Record r -> JSX
foreign import scrollBarImpl :: forall r. Record r -> JSX

scrollArea :: { children :: Array JSX } -> JSX
scrollArea props = scrollAreaImpl props

scrollBar :: { orientation :: String } -> JSX
scrollBar props = scrollBarImpl props
