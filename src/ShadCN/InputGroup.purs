module ShadCN.InputGroup where

import React.Basic (JSX)
import React.Basic.DOM as R

inputGroup :: Array JSX -> JSX
inputGroup kids = R.div { className: "border-input dark:bg-input/30 relative flex w-full items-center rounded-md border shadow-xs transition-[color,box-shadow] outline-none h-9 min-w-0", role: "group", children: kids }

inputGroupAddon :: Array JSX -> JSX
inputGroupAddon kids = R.div { className: "text-muted-foreground flex h-auto items-center justify-center gap-2 py-1.5 text-sm font-medium select-none order-first pl-3", children: kids }

inputGroupText :: Array JSX -> JSX
inputGroupText kids = R.span { className: "text-muted-foreground flex items-center gap-2 text-sm", children: kids }
