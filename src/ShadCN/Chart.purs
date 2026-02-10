module ShadCN.Chart where

import React.Basic (JSX)
import Yoga.React.DOM.HTML (div)
import Yoga.React.DOM.Internal (class IsJSX)

chartContainer :: forall kids. IsJSX kids => kids -> JSX
chartContainer = div { className: "flex aspect-video justify-center text-xs" }
