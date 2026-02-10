module ShadCN.Field where

import React.Basic (JSX)

foreign import fieldSetImpl :: forall r. Record r -> JSX
foreign import fieldGroupImpl :: forall r. Record r -> JSX
foreign import fieldImpl :: forall r. Record r -> JSX
foreign import fieldContentImpl :: forall r. Record r -> JSX
foreign import fieldLabelImpl :: forall r. Record r -> JSX
foreign import fieldDescriptionImpl :: forall r. Record r -> JSX
foreign import fieldErrorImpl :: forall r. Record r -> JSX

fieldSet :: { children :: Array JSX } -> JSX
fieldSet props = fieldSetImpl props

fieldGroup :: { children :: Array JSX } -> JSX
fieldGroup props = fieldGroupImpl props

field :: { children :: Array JSX } -> JSX
field props = fieldImpl props

fieldContent :: { children :: Array JSX } -> JSX
fieldContent props = fieldContentImpl props

fieldLabel :: { children :: Array JSX } -> JSX
fieldLabel props = fieldLabelImpl props

fieldDescription :: { children :: Array JSX } -> JSX
fieldDescription props = fieldDescriptionImpl props

fieldError :: { children :: Array JSX } -> JSX
fieldError props = fieldErrorImpl props
