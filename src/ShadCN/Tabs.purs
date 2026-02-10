module ShadCN.Tabs where

import React.Basic (JSX)

foreign import tabsImpl :: forall r. Record r -> JSX
foreign import tabsListImpl :: forall r. Record r -> JSX
foreign import tabsTriggerImpl :: forall r. Record r -> JSX
foreign import tabsContentImpl :: forall r. Record r -> JSX

tabs :: String -> Array JSX -> JSX
tabs defaultValue kids = tabsImpl { defaultValue, children: kids }

tabsList :: Array JSX -> JSX
tabsList kids = tabsListImpl { children: kids }

tabsTrigger :: String -> Array JSX -> JSX
tabsTrigger value kids = tabsTriggerImpl { value, children: kids }

tabsContent :: String -> Array JSX -> JSX
tabsContent value kids = tabsContentImpl { value, children: kids }
