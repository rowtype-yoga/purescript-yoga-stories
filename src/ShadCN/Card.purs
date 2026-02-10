module ShadCN.Card where

import React.Basic (JSX)
import Yoga.React.DOM.HTML (div)
import Yoga.React.DOM.Internal (class IsJSX)

card :: forall kids. IsJSX kids => kids -> JSX
card = div { className: "bg-card text-card-foreground flex flex-col gap-6 rounded-xl border py-6 shadow-sm" }

cardHeader :: forall kids. IsJSX kids => kids -> JSX
cardHeader = div { className: "grid auto-rows-min grid-rows-[auto_auto] items-start gap-2 px-6" }

cardTitle :: forall kids. IsJSX kids => kids -> JSX
cardTitle = div { className: "leading-none font-semibold" }

cardDescription :: forall kids. IsJSX kids => kids -> JSX
cardDescription = div { className: "text-muted-foreground text-sm" }

cardContent :: forall kids. IsJSX kids => kids -> JSX
cardContent = div { className: "px-6" }

cardFooter :: forall kids. IsJSX kids => kids -> JSX
cardFooter = div { className: "flex items-center px-6" }
