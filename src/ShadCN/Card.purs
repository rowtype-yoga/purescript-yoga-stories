module ShadCN.Card where

import React.Basic (JSX)
import React.Basic.DOM as R

card :: Array JSX -> JSX
card kids = R.div { className: "bg-card text-card-foreground flex flex-col gap-6 rounded-xl border py-6 shadow-sm", children: kids }

cardHeader :: Array JSX -> JSX
cardHeader kids = R.div { className: "grid auto-rows-min grid-rows-[auto_auto] items-start gap-2 px-6", children: kids }

cardTitle :: Array JSX -> JSX
cardTitle kids = R.div { className: "leading-none font-semibold", children: kids }

cardDescription :: Array JSX -> JSX
cardDescription kids = R.div { className: "text-muted-foreground text-sm", children: kids }

cardContent :: Array JSX -> JSX
cardContent kids = R.div { className: "px-6", children: kids }

cardFooter :: Array JSX -> JSX
cardFooter kids = R.div { className: "flex items-center px-6", children: kids }
