module ShadCN.Table where

import React.Basic (JSX)
import Yoga.React.DOM.HTML (div, table, thead, tbody, tfoot, tr, th, td, caption)
import Yoga.React.DOM.Internal (class IsJSX)

shadTable :: forall kids. IsJSX kids => kids -> JSX
shadTable kids = div { className: "relative w-full overflow-x-auto" }
  [ table { className: "w-full caption-bottom text-sm" } kids ]

tableHeader :: forall kids. IsJSX kids => kids -> JSX
tableHeader = thead { className: "[&_tr]:border-b" }

tableBody :: forall kids. IsJSX kids => kids -> JSX
tableBody = tbody { className: "[&_tr:last-child]:border-0" }

tableFooter :: forall kids. IsJSX kids => kids -> JSX
tableFooter = tfoot { className: "bg-muted/50 border-t font-medium [&>tr]:last:border-b-0" }

tableRow :: forall kids. IsJSX kids => kids -> JSX
tableRow = tr { className: "hover:bg-muted/50 data-[state=selected]:bg-muted border-b transition-colors" }

tableHead :: forall kids. IsJSX kids => kids -> JSX
tableHead = th { className: "text-foreground h-10 px-2 text-left align-middle font-medium whitespace-nowrap" }

tableCell :: forall kids. IsJSX kids => kids -> JSX
tableCell = td { className: "p-2 align-middle whitespace-nowrap" }

tableCaption :: forall kids. IsJSX kids => kids -> JSX
tableCaption = caption { className: "text-muted-foreground mt-4 text-sm" }
