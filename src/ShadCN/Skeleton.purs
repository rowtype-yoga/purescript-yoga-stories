module ShadCN.Skeleton where

import React.Basic (JSX)
import Yoga.React.DOM.HTML.Div (div_)

skeleton :: JSX
skeleton = div_ { className: "bg-accent animate-pulse rounded-md" }
