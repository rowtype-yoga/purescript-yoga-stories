module ShadCN.Tabs where

import React.Basic (JSX, element)
import ShadCN.Radix as Radix

tabs :: String -> Array JSX -> JSX
tabs defaultValue kids = element Radix.tabsRoot { className: "flex gap-2 flex-col", defaultValue, children: kids }

tabsList :: Array JSX -> JSX
tabsList kids = element Radix.tabsList { className: "bg-muted text-muted-foreground inline-flex w-fit items-center justify-center rounded-lg p-[3px] h-9", children: kids }

tabsTrigger :: String -> Array JSX -> JSX
tabsTrigger value kids = element Radix.tabsTrigger { className: "text-foreground/60 hover:text-foreground dark:text-muted-foreground inline-flex h-[calc(100%-1px)] flex-1 items-center justify-center gap-1.5 rounded-md border border-transparent px-2 py-1 text-sm font-medium whitespace-nowrap transition-all focus-visible:ring-[3px] disabled:pointer-events-none disabled:opacity-50 data-[state=active]:bg-background data-[state=active]:text-foreground data-[state=active]:shadow-sm", value, children: kids }

tabsContent :: String -> Array JSX -> JSX
tabsContent value kids = element Radix.tabsContent { className: "flex-1 outline-none", value, children: kids }
