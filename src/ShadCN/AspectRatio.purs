module ShadCN.AspectRatio where

import Prelude
import Data.Int (toNumber)
import React.Basic (JSX)
import Yoga.React.DOM.Internal (class IsJSX, createElement)
import ShadCN.Radix as Radix

by :: forall kids. IsJSX kids => Int -> Int -> kids -> JSX
by w h = createElement Radix.aspectRatioRoot { ratio: toNumber w / toNumber h }
