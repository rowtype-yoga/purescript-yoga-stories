module ShadCN.Spinner where

import Foreign.Object (singleton)
import React.Basic (JSX)
import React.Basic.DOM.SVG (circle, path, svg)

spinner :: JSX
spinner = svg
  { className: "size-4 animate-spin"
  , xmlns: "http://www.w3.org/2000/svg"
  , fill: "none"
  , viewBox: "0 0 24 24"
  , _aria: singleton "label" "Loading"
  , children:
      [ circle { cx: "12", cy: "12", r: "10", stroke: "currentColor", strokeWidth: "4", opacity: "0.25" }
      , path { fill: "currentColor", opacity: "0.75", d: "M4 12a8 8 0 018-8V0C5.373 0 0 5.373 0 12h4zm2 5.291A7.962 7.962 0 014 12H0c0 3.042 1.135 5.824 3 7.938l3-2.647z" }
      ]
  }
