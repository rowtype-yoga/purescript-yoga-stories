module ShadCN.Select where

import React.Basic (JSX)

foreign import selectImpl :: forall r. Record r -> JSX
foreign import selectTriggerImpl :: forall r. Record r -> JSX
foreign import selectContentImpl :: forall r. Record r -> JSX
foreign import selectItemImpl :: forall r. Record r -> JSX
foreign import selectValueImpl :: forall r. Record r -> JSX
foreign import selectGroupImpl :: forall r. Record r -> JSX
foreign import selectLabelImpl :: forall r. Record r -> JSX
foreign import selectSeparatorImpl :: forall r. Record r -> JSX

select :: Array JSX -> JSX
select kids = selectImpl { children: kids }

selectTrigger :: Array JSX -> JSX
selectTrigger kids = selectTriggerImpl { children: kids }

selectContent :: Array JSX -> JSX
selectContent kids = selectContentImpl { children: kids }

selectItem :: String -> Array JSX -> JSX
selectItem value kids = selectItemImpl { value, children: kids }

selectValue :: { placeholder :: String } -> JSX
selectValue props = selectValueImpl props

selectGroup :: Array JSX -> JSX
selectGroup kids = selectGroupImpl { children: kids }

selectLabel :: Array JSX -> JSX
selectLabel kids = selectLabelImpl { children: kids }

selectSeparator :: JSX
selectSeparator = selectSeparatorImpl {}
