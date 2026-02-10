module ShadCN.ScrollArea where

import React.Basic (JSX)

foreign import scrollAreaImpl :: forall r. Record r -> JSX
foreign import scrollBarImpl :: forall r. Record r -> JSX

scrollArea :: Array JSX -> JSX
scrollArea kids = scrollAreaImpl { children: kids }

scrollBar :: { orientation :: String } -> JSX
scrollBar props = scrollBarImpl props
