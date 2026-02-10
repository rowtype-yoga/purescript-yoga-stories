module ShadCN.AspectRatio where

import React.Basic (JSX, element)
import ShadCN.Radix as Radix

aspectRatio :: Number -> Array JSX -> JSX
aspectRatio ratio kids = element Radix.aspectRatioRoot { ratio, children: kids }
