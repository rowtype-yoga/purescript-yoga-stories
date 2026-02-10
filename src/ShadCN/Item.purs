module ShadCN.Item where

import React.Basic (JSX)
import React.Basic.DOM as R

item :: Array JSX -> JSX
item kids = R.div { className: "group/item flex items-center border border-transparent text-sm rounded-md transition-colors flex-wrap p-4 gap-4", children: kids }

itemGroup :: Array JSX -> JSX
itemGroup kids = R.div { className: "flex flex-col", role: "list", children: kids }

itemMedia :: Array JSX -> JSX
itemMedia kids = R.div { className: "flex shrink-0 items-center justify-center gap-2", children: kids }

itemContent :: Array JSX -> JSX
itemContent kids = R.div { className: "flex flex-1 flex-col gap-1", children: kids }

itemTitle :: Array JSX -> JSX
itemTitle kids = R.div { className: "flex w-fit items-center gap-2 text-sm leading-snug font-medium", children: kids }

itemDescription :: Array JSX -> JSX
itemDescription kids = R.p { className: "text-muted-foreground line-clamp-2 text-sm leading-normal font-normal text-balance", children: kids }

itemActions :: Array JSX -> JSX
itemActions kids = R.div { className: "flex items-center gap-2", children: kids }
