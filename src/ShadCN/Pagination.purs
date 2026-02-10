module ShadCN.Pagination where

import React.Basic (JSX)
import React.Basic.DOM as R

pagination :: Array JSX -> JSX
pagination kids = R.nav { className: "mx-auto flex w-full justify-center", role: "navigation", children: kids }

paginationContent :: Array JSX -> JSX
paginationContent kids = R.ul { className: "flex flex-row items-center gap-1", children: kids }

paginationItem :: Array JSX -> JSX
paginationItem kids = R.li { children: kids }

paginationLink :: String -> Array JSX -> JSX
paginationLink href kids = R.a { href, className: "inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium h-9 px-4 py-2 hover:bg-accent hover:text-accent-foreground", children: kids }

paginationEllipsis :: JSX
paginationEllipsis = R.span { className: "flex size-9 items-center justify-center", children: [ R.text "..." ] }
