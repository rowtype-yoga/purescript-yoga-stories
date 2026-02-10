module ShadCN.Skeleton where

import React.Basic (JSX)
import React.Basic.DOM as R

skeleton :: JSX
skeleton = R.div { className: "bg-accent animate-pulse rounded-md" }
