module ShadCN.Tabs where

import React.Basic (JSX)
import Yoga.React.DOM.Internal (class IsJSX, createElement)
import ShadCN.Radix as Radix

tabs :: forall kids. IsJSX kids => String -> kids -> JSX
tabs defaultValue = createElement Radix.tabsRoot { className: "flex gap-2 flex-col", defaultValue }

tabsList :: forall kids. IsJSX kids => kids -> JSX
tabsList = createElement Radix.tabsList { className: "bg-muted text-muted-foreground inline-flex w-fit items-center justify-center rounded-lg p-[3px] h-9" }

tabsTrigger :: forall kids. IsJSX kids => String -> kids -> JSX
tabsTrigger value = createElement Radix.tabsTrigger { className: "text-foreground/60 hover:text-foreground dark:text-muted-foreground inline-flex h-[calc(100%-1px)] flex-1 items-center justify-center gap-1.5 rounded-md border border-transparent px-2 py-1 text-sm font-medium whitespace-nowrap transition-all focus-visible:ring-[3px] disabled:pointer-events-none disabled:opacity-50 data-[state=active]:bg-background data-[state=active]:text-foreground data-[state=active]:shadow-sm", value }

tabsContent :: forall kids. IsJSX kids => String -> kids -> JSX
tabsContent value = createElement Radix.tabsContent { className: "flex-1 outline-none", value }
