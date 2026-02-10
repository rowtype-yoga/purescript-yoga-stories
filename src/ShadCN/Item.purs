module ShadCN.Item where

import React.Basic (JSX)
import Yoga.React.DOM.HTML (div, p)
import Yoga.React.DOM.Internal (class IsJSX)

item :: forall kids. IsJSX kids => kids -> JSX
item = div { className: "group/item flex items-center border border-transparent text-sm rounded-md transition-colors flex-wrap p-4 gap-4" }

itemGroup :: forall kids. IsJSX kids => kids -> JSX
itemGroup = div { className: "flex flex-col", role: "list" }

itemMedia :: forall kids. IsJSX kids => kids -> JSX
itemMedia = div { className: "flex shrink-0 items-center justify-center gap-2" }

itemContent :: forall kids. IsJSX kids => kids -> JSX
itemContent = div { className: "flex flex-1 flex-col gap-1" }

itemTitle :: forall kids. IsJSX kids => kids -> JSX
itemTitle = div { className: "flex w-fit items-center gap-2 text-sm leading-snug font-medium" }

itemDescription :: forall kids. IsJSX kids => kids -> JSX
itemDescription = p { className: "text-muted-foreground line-clamp-2 text-sm leading-normal font-normal text-balance" }

itemActions :: forall kids. IsJSX kids => kids -> JSX
itemActions = div { className: "flex items-center gap-2" }
