module ShadCN.Badge where

import Data.Generic.Rep (class Generic)
import React.Basic (JSX)

data Variant = Default | Secondary | Destructive | Outline
derive instance Generic Variant _

foreign import badgeImpl :: forall r. Record r -> JSX

badge :: { variant :: Variant, children :: Array JSX } -> JSX
badge props =
  badgeImpl { variant: variantStr props.variant, children: props.children }

variantStr :: Variant -> String
variantStr = case _ of
  Default -> "default"
  Secondary -> "secondary"
  Destructive -> "destructive"
  Outline -> "outline"
