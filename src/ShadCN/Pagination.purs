module ShadCN.Pagination where

import React.Basic (JSX)

foreign import paginationImpl :: forall r. Record r -> JSX
foreign import paginationContentImpl :: forall r. Record r -> JSX
foreign import paginationItemImpl :: forall r. Record r -> JSX
foreign import paginationLinkImpl :: forall r. Record r -> JSX
foreign import paginationPreviousImpl :: forall r. Record r -> JSX
foreign import paginationNextImpl :: forall r. Record r -> JSX
foreign import paginationEllipsisImpl :: forall r. Record r -> JSX

pagination :: { children :: Array JSX } -> JSX
pagination props = paginationImpl props

paginationContent :: { children :: Array JSX } -> JSX
paginationContent props = paginationContentImpl props

paginationItem :: { children :: Array JSX } -> JSX
paginationItem props = paginationItemImpl props

paginationLink :: { isActive :: Boolean, href :: String, children :: Array JSX } -> JSX
paginationLink props = paginationLinkImpl props

paginationPrevious :: { href :: String } -> JSX
paginationPrevious props = paginationPreviousImpl props

paginationNext :: { href :: String } -> JSX
paginationNext props = paginationNextImpl props

paginationEllipsis :: JSX
paginationEllipsis = paginationEllipsisImpl {}
