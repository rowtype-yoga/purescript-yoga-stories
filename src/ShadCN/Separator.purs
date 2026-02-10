module ShadCN.Separator where

import React.Basic (JSX, element)
import ShadCN.Radix as Radix

separator :: JSX
separator = element Radix.separatorRoot { className: "bg-border shrink-0 data-[orientation=horizontal]:h-px data-[orientation=horizontal]:w-full data-[orientation=vertical]:h-full data-[orientation=vertical]:w-px", orientation: "horizontal", decorative: true }

separatorVertical :: JSX
separatorVertical = element Radix.separatorRoot { className: "bg-border shrink-0 data-[orientation=horizontal]:h-px data-[orientation=horizontal]:w-full data-[orientation=vertical]:h-full data-[orientation=vertical]:w-px", orientation: "vertical", decorative: true }
