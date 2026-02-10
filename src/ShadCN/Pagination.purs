module ShadCN.Pagination where

import React.Basic (JSX)
import Yoga.React.DOM.HTML (nav, ul, li, a, span)
import Yoga.React.DOM.Internal (class IsJSX, text)

pagination :: forall kids. IsJSX kids => kids -> JSX
pagination = nav { className: "mx-auto flex w-full justify-center", role: "navigation" }

paginationContent :: forall kids. IsJSX kids => kids -> JSX
paginationContent = ul { className: "flex flex-row items-center gap-1" }

paginationItem :: forall kids. IsJSX kids => kids -> JSX
paginationItem = li {}

paginationLink :: forall kids. IsJSX kids => String -> kids -> JSX
paginationLink href = a { href, className: "inline-flex items-center justify-center gap-2 whitespace-nowrap rounded-md text-sm font-medium h-9 px-4 py-2 hover:bg-accent hover:text-accent-foreground" }

paginationEllipsis :: JSX
paginationEllipsis = span { className: "flex size-9 items-center justify-center" } (text "...")
