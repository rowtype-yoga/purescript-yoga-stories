module ShadCN.Tabs where

import React.Basic (JSX)

foreign import tabsImpl :: forall r. Record r -> JSX
foreign import tabsListImpl :: forall r. Record r -> JSX
foreign import tabsTriggerImpl :: forall r. Record r -> JSX
foreign import tabsContentImpl :: forall r. Record r -> JSX

tabs :: { defaultValue :: String, children :: Array JSX } -> JSX
tabs props = tabsImpl props

tabsList :: { children :: Array JSX } -> JSX
tabsList props = tabsListImpl props

tabsTrigger :: { value :: String, children :: Array JSX } -> JSX
tabsTrigger props = tabsTriggerImpl props

tabsContent :: { value :: String, children :: Array JSX } -> JSX
tabsContent props = tabsContentImpl props
