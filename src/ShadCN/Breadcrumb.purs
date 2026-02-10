module ShadCN.Breadcrumb where

import React.Basic (JSX)

foreign import breadcrumbImpl :: forall r. Record r -> JSX
foreign import breadcrumbListImpl :: forall r. Record r -> JSX
foreign import breadcrumbItemImpl :: forall r. Record r -> JSX
foreign import breadcrumbLinkImpl :: forall r. Record r -> JSX
foreign import breadcrumbPageImpl :: forall r. Record r -> JSX
foreign import breadcrumbSeparatorImpl :: forall r. Record r -> JSX

breadcrumb :: { children :: Array JSX } -> JSX
breadcrumb props = breadcrumbImpl props

breadcrumbList :: { children :: Array JSX } -> JSX
breadcrumbList props = breadcrumbListImpl props

breadcrumbItem :: { children :: Array JSX } -> JSX
breadcrumbItem props = breadcrumbItemImpl props

breadcrumbLink :: { href :: String, children :: Array JSX } -> JSX
breadcrumbLink props = breadcrumbLinkImpl props

breadcrumbPage :: { children :: Array JSX } -> JSX
breadcrumbPage props = breadcrumbPageImpl props

breadcrumbSeparator :: JSX
breadcrumbSeparator = breadcrumbSeparatorImpl {}
