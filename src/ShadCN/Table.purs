module ShadCN.Table where

import React.Basic (JSX)

foreign import tableImpl :: forall r. Record r -> JSX
foreign import tableHeaderImpl :: forall r. Record r -> JSX
foreign import tableBodyImpl :: forall r. Record r -> JSX
foreign import tableFooterImpl :: forall r. Record r -> JSX
foreign import tableRowImpl :: forall r. Record r -> JSX
foreign import tableHeadImpl :: forall r. Record r -> JSX
foreign import tableCellImpl :: forall r. Record r -> JSX
foreign import tableCaptionImpl :: forall r. Record r -> JSX

table :: { children :: Array JSX } -> JSX
table props = tableImpl { children: props.children }

tableHeader :: { children :: Array JSX } -> JSX
tableHeader props = tableHeaderImpl { children: props.children }

tableBody :: { children :: Array JSX } -> JSX
tableBody props = tableBodyImpl { children: props.children }

tableFooter :: { children :: Array JSX } -> JSX
tableFooter props = tableFooterImpl { children: props.children }

tableRow :: { children :: Array JSX } -> JSX
tableRow props = tableRowImpl { children: props.children }

tableHead :: { children :: Array JSX } -> JSX
tableHead props = tableHeadImpl { children: props.children }

tableCell :: { children :: Array JSX } -> JSX
tableCell props = tableCellImpl { children: props.children }

tableCaption :: { children :: Array JSX } -> JSX
tableCaption props = tableCaptionImpl { children: props.children }
