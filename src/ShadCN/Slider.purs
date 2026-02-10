module ShadCN.Slider where

import React.Basic (JSX, element)
import ShadCN.Radix as Radix

slider :: forall r. { | r } -> JSX
slider props = element Radix.sliderRoot { className: "relative flex w-full touch-none items-center select-none data-[disabled]:opacity-50", children:
  [ element Radix.sliderTrack { className: "bg-muted relative grow overflow-hidden rounded-full h-1.5 w-full", children:
    [ element Radix.sliderRange { className: "bg-primary absolute h-full" } ] }
  , element Radix.sliderThumb { className: "border-primary ring-ring/50 block size-4 shrink-0 rounded-full border bg-white shadow-sm transition-[color,box-shadow] hover:ring-4 focus-visible:ring-4 focus-visible:outline-hidden disabled:pointer-events-none disabled:opacity-50" }
  ] }
