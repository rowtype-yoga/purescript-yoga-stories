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

select :: { children :: Array JSX } -> JSX
select props = selectImpl props

selectTrigger :: { children :: Array JSX } -> JSX
selectTrigger props = selectTriggerImpl props

selectContent :: { children :: Array JSX } -> JSX
selectContent props = selectContentImpl props

selectItem :: { value :: String, children :: Array JSX } -> JSX
selectItem props = selectItemImpl props

selectValue :: { placeholder :: String } -> JSX
selectValue props = selectValueImpl props

selectGroup :: { children :: Array JSX } -> JSX
selectGroup props = selectGroupImpl props

selectLabel :: { children :: Array JSX } -> JSX
selectLabel props = selectLabelImpl props

selectSeparator :: JSX
selectSeparator = selectSeparatorImpl {}
