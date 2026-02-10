module ShadCN.Breadcrumb where

import React.Basic (JSX)
import Yoga.React.DOM.HTML (nav, ol, li, a, span)
import Yoga.React.DOM.Internal (class IsJSX, text)

breadcrumb :: forall kids. IsJSX kids => kids -> JSX
breadcrumb = nav {}

breadcrumbList :: forall kids. IsJSX kids => kids -> JSX
breadcrumbList = ol { className: "text-muted-foreground flex flex-wrap items-center gap-1.5 text-sm break-words sm:gap-2.5" }

breadcrumbItem :: forall kids. IsJSX kids => kids -> JSX
breadcrumbItem = li { className: "inline-flex items-center gap-1.5" }

breadcrumbLink :: forall kids. IsJSX kids => String -> kids -> JSX
breadcrumbLink href = a { href, className: "hover:text-foreground transition-colors" }

breadcrumbPage :: forall kids. IsJSX kids => kids -> JSX
breadcrumbPage = span { className: "text-foreground font-normal" }

breadcrumbSeparator :: JSX
breadcrumbSeparator = li { className: "[&>svg]:size-3.5", role: "presentation" } (text "/")
