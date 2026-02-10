module ShadCN.Alert where

import Data.Generic.Rep (class Generic)
import React.Basic (JSX)

data Variant = Default | Destructive
derive instance Generic Variant _

foreign import alertImpl :: forall r. Record r -> JSX
foreign import alertTitleImpl :: forall r. Record r -> JSX
foreign import alertDescriptionImpl :: forall r. Record r -> JSX

alert :: { variant :: Variant, children :: Array JSX } -> JSX
alert props =
  alertImpl { variant: variantStr props.variant, children: props.children }

alertTitle :: { children :: Array JSX } -> JSX
alertTitle props = alertTitleImpl { children: props.children }

alertDescription :: { children :: Array JSX } -> JSX
alertDescription props = alertDescriptionImpl { children: props.children }

variantStr :: Variant -> String
variantStr = case _ of
  Default -> "default"
  Destructive -> "destructive"
