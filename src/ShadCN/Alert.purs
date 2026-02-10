module ShadCN.Alert where

import React.Basic (JSX)
import React.Basic.DOM as R

alert :: Array JSX -> JSX
alert kids = R.div { className: "relative w-full rounded-lg border px-4 py-3 text-sm grid has-[>svg]:grid-cols-[calc(var(--spacing)*4)_1fr] grid-cols-[0_1fr] has-[>svg]:gap-x-3 gap-y-0.5 items-start [&>svg]:size-4 [&>svg]:translate-y-0.5 [&>svg]:text-current bg-card text-card-foreground", role: "alert", children: kids }

alertDestructive :: Array JSX -> JSX
alertDestructive kids = R.div { className: "relative w-full rounded-lg border px-4 py-3 text-sm grid has-[>svg]:grid-cols-[calc(var(--spacing)*4)_1fr] grid-cols-[0_1fr] has-[>svg]:gap-x-3 gap-y-0.5 items-start [&>svg]:size-4 [&>svg]:translate-y-0.5 [&>svg]:text-current text-destructive bg-card", role: "alert", children: kids }

alertTitle :: Array JSX -> JSX
alertTitle kids = R.div { className: "col-start-2 line-clamp-1 min-h-4 font-medium tracking-tight", children: kids }

alertDescription :: Array JSX -> JSX
alertDescription kids = R.div { className: "text-muted-foreground col-start-2 grid justify-items-start gap-1 text-sm", children: kids }
