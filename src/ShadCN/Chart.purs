module ShadCN.Chart where

import React.Basic (JSX)
import React.Basic.DOM as R

chartContainer :: Array JSX -> JSX
chartContainer kids = R.div { className: "flex aspect-video justify-center text-xs", children: kids }
