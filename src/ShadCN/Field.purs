module ShadCN.Field where

import React.Basic (JSX)
import Yoga.React.DOM.HTML (div, fieldset, p)
import Yoga.React.DOM.Internal (class IsJSX)

fieldSet :: forall kids. IsJSX kids => kids -> JSX
fieldSet = fieldset { className: "flex flex-col gap-6" }

fieldGroup :: forall kids. IsJSX kids => kids -> JSX
fieldGroup = div { className: "flex w-full flex-col gap-7" }

field :: forall kids. IsJSX kids => kids -> JSX
field = div { className: "group/field flex w-full gap-3 flex-col", role: "group" }

fieldContent :: forall kids. IsJSX kids => kids -> JSX
fieldContent = div { className: "flex flex-1 flex-col gap-1.5 leading-snug" }

fieldLabel :: forall kids. IsJSX kids => kids -> JSX
fieldLabel = div { className: "flex w-fit items-center gap-2 text-sm leading-snug font-medium" }

fieldDescription :: forall kids. IsJSX kids => kids -> JSX
fieldDescription = p { className: "text-muted-foreground text-sm leading-normal font-normal" }

fieldError :: forall kids. IsJSX kids => kids -> JSX
fieldError = div { className: "text-destructive text-sm font-normal", role: "alert" }
