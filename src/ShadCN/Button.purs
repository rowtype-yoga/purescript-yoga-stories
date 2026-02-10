module ShadCN.Button where

import Data.Generic.Rep (class Generic)
import React.Basic (JSX)

data Variant = Default | Destructive | Outline | Secondary | Ghost | Link
derive instance Generic Variant _

data Size = DefaultSize | XS | SM | LG | Icon
derive instance Generic Size _

foreign import buttonImpl :: forall r. Record r -> JSX

button :: { variant :: Variant, size :: Size, children :: Array JSX } -> JSX
button props =
  buttonImpl { variant: variantStr props.variant, size: sizeStr props.size, children: props.children }

variantStr :: Variant -> String
variantStr = case _ of
  Default -> "default"
  Destructive -> "destructive"
  Outline -> "outline"
  Secondary -> "secondary"
  Ghost -> "ghost"
  Link -> "link"

sizeStr :: Size -> String
sizeStr = case _ of
  DefaultSize -> "default"
  XS -> "xs"
  SM -> "sm"
  LG -> "lg"
  Icon -> "icon"
