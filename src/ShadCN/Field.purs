module ShadCN.Field where

import React.Basic (JSX)
import React.Basic.DOM as R

fieldSet :: Array JSX -> JSX
fieldSet kids = R.fieldset { className: "flex flex-col gap-6", children: kids }

fieldGroup :: Array JSX -> JSX
fieldGroup kids = R.div { className: "flex w-full flex-col gap-7", children: kids }

field :: Array JSX -> JSX
field kids = R.div { className: "group/field flex w-full gap-3 flex-col", role: "group", children: kids }

fieldContent :: Array JSX -> JSX
fieldContent kids = R.div { className: "flex flex-1 flex-col gap-1.5 leading-snug", children: kids }

fieldLabel :: Array JSX -> JSX
fieldLabel kids = R.div { className: "flex w-fit items-center gap-2 text-sm leading-snug font-medium", children: kids }

fieldDescription :: Array JSX -> JSX
fieldDescription kids = R.p { className: "text-muted-foreground text-sm leading-normal font-normal", children: kids }

fieldError :: Array JSX -> JSX
fieldError kids = R.div { className: "text-destructive text-sm font-normal", role: "alert", children: kids }
