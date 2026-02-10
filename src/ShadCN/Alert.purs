module ShadCN.Alert where

import React.Basic (JSX)
import Yoga.React.DOM.HTML (div)
import Yoga.React.DOM.Internal (class IsJSX)

alert :: forall kids. IsJSX kids => kids -> JSX
alert = div { className: "relative w-full rounded-lg border px-4 py-3 text-sm grid has-[>svg]:grid-cols-[calc(var(--spacing)*4)_1fr] grid-cols-[0_1fr] has-[>svg]:gap-x-3 gap-y-0.5 items-start [&>svg]:size-4 [&>svg]:translate-y-0.5 [&>svg]:text-current bg-card text-card-foreground", role: "alert" }

alertDestructive :: forall kids. IsJSX kids => kids -> JSX
alertDestructive = div { className: "relative w-full rounded-lg border px-4 py-3 text-sm grid has-[>svg]:grid-cols-[calc(var(--spacing)*4)_1fr] grid-cols-[0_1fr] has-[>svg]:gap-x-3 gap-y-0.5 items-start [&>svg]:size-4 [&>svg]:translate-y-0.5 [&>svg]:text-current text-destructive bg-card", role: "alert" }

alertTitle :: forall kids. IsJSX kids => kids -> JSX
alertTitle = div { className: "col-start-2 line-clamp-1 min-h-4 font-medium tracking-tight" }

alertDescription :: forall kids. IsJSX kids => kids -> JSX
alertDescription = div { className: "text-muted-foreground col-start-2 grid justify-items-start gap-1 text-sm" }
