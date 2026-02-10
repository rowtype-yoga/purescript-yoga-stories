module ShadCN.Breadcrumb where

import React.Basic (JSX)
import React.Basic.DOM as R

breadcrumb :: Array JSX -> JSX
breadcrumb kids = R.nav { children: kids }

breadcrumbList :: Array JSX -> JSX
breadcrumbList kids = R.ol { className: "text-muted-foreground flex flex-wrap items-center gap-1.5 text-sm break-words sm:gap-2.5", children: kids }

breadcrumbItem :: Array JSX -> JSX
breadcrumbItem kids = R.li { className: "inline-flex items-center gap-1.5", children: kids }

breadcrumbLink :: String -> Array JSX -> JSX
breadcrumbLink href kids = R.a { href, className: "hover:text-foreground transition-colors", children: kids }

breadcrumbPage :: Array JSX -> JSX
breadcrumbPage kids = R.span { className: "text-foreground font-normal", children: kids }

breadcrumbSeparator :: JSX
breadcrumbSeparator = R.li { className: "[&>svg]:size-3.5", role: "presentation", children: [ R.text "/" ] }
