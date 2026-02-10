module ShadCN.Slider where

import React.Basic (JSX)
import Yoga.React.DOM.Internal (createElement)
import ShadCN.Radix as Radix

slider :: forall r. { | r } -> JSX
slider props = createElement Radix.sliderRoot { className: "relative flex w-full touch-none items-center select-none data-[disabled]:opacity-50" }
  [ createElement Radix.sliderTrack { className: "bg-muted relative grow overflow-hidden rounded-full h-1.5 w-full" }
    [ createElement Radix.sliderRange { className: "bg-primary absolute h-full" } ([] :: Array JSX) ]
  , createElement Radix.sliderThumb { className: "border-primary ring-ring/50 block size-4 shrink-0 rounded-full border bg-white shadow-sm transition-[color,box-shadow] hover:ring-4 focus-visible:ring-4 focus-visible:outline-hidden disabled:pointer-events-none disabled:opacity-50" } ([] :: Array JSX)
  ]
