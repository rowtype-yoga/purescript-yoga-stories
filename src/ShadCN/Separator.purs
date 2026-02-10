module ShadCN.Separator where

import React.Basic (JSX)
import Yoga.React.DOM.Internal (createElement)
import ShadCN.Radix as Radix

separator :: JSX
separator = createElement Radix.separatorRoot { className: "bg-border shrink-0 data-[orientation=horizontal]:h-px data-[orientation=horizontal]:w-full data-[orientation=vertical]:h-full data-[orientation=vertical]:w-px", orientation: "horizontal", decorative: true } ([] :: Array JSX)

separatorVertical :: JSX
separatorVertical = createElement Radix.separatorRoot { className: "bg-border shrink-0 data-[orientation=horizontal]:h-px data-[orientation=horizontal]:w-full data-[orientation=vertical]:h-full data-[orientation=vertical]:w-px", orientation: "vertical", decorative: true } ([] :: Array JSX)
