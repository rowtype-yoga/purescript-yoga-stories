module ShadCN.ScrollArea where

import React.Basic (JSX, element)
import ShadCN.Radix as Radix

scrollArea :: Array JSX -> JSX
scrollArea kids = element Radix.scrollAreaRoot { className: "relative", children:
  [ element Radix.scrollAreaViewport { className: "size-full rounded-[inherit]", children: kids }
  , scrollBar
  , element Radix.scrollAreaCorner {}
  ] }

scrollBar :: JSX
scrollBar = element Radix.scrollAreaScrollbar { className: "flex touch-none p-px transition-colors select-none h-full w-2.5 border-l border-l-transparent", orientation: "vertical", children:
  [ element Radix.scrollAreaThumb { className: "bg-border relative flex-1 rounded-full" } ] }
