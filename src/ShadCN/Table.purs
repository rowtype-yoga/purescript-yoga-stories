module ShadCN.Table where

import React.Basic (JSX)
import React.Basic.DOM as R

table :: Array JSX -> JSX
table kids = R.div { className: "relative w-full overflow-x-auto", children: [ R.table { className: "w-full caption-bottom text-sm", children: kids } ] }

tableHeader :: Array JSX -> JSX
tableHeader kids = R.thead { className: "[&_tr]:border-b", children: kids }

tableBody :: Array JSX -> JSX
tableBody kids = R.tbody { className: "[&_tr:last-child]:border-0", children: kids }

tableFooter :: Array JSX -> JSX
tableFooter kids = R.tfoot { className: "bg-muted/50 border-t font-medium [&>tr]:last:border-b-0", children: kids }

tableRow :: Array JSX -> JSX
tableRow kids = R.tr { className: "hover:bg-muted/50 data-[state=selected]:bg-muted border-b transition-colors", children: kids }

tableHead :: Array JSX -> JSX
tableHead kids = R.th { className: "text-foreground h-10 px-2 text-left align-middle font-medium whitespace-nowrap", children: kids }

tableCell :: Array JSX -> JSX
tableCell kids = R.td { className: "p-2 align-middle whitespace-nowrap", children: kids }

tableCaption :: Array JSX -> JSX
tableCaption kids = R.caption { className: "text-muted-foreground mt-4 text-sm", children: kids }
