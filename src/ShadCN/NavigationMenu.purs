module ShadCN.NavigationMenu where

import React.Basic (JSX)
import Yoga.React.DOM.Internal (class IsJSX, createElement)
import ShadCN.Radix as Radix

navigationMenu :: forall kids. IsJSX kids => kids -> JSX
navigationMenu = createElement Radix.navigationMenuRoot { className: "relative flex max-w-max flex-1 items-center justify-center" }

navigationMenuList :: forall kids. IsJSX kids => kids -> JSX
navigationMenuList = createElement Radix.navigationMenuList { className: "group flex flex-1 list-none items-center justify-center gap-1" }

navigationMenuItem :: forall kids. IsJSX kids => kids -> JSX
navigationMenuItem = createElement Radix.navigationMenuItem {}

navigationMenuTrigger :: forall kids. IsJSX kids => kids -> JSX
navigationMenuTrigger = createElement Radix.navigationMenuTrigger { className: "group inline-flex h-9 w-max items-center justify-center rounded-md bg-background px-4 py-2 text-sm font-medium hover:bg-accent hover:text-accent-foreground focus:bg-accent focus:text-accent-foreground focus:outline-none disabled:pointer-events-none disabled:opacity-50" }

navigationMenuContent :: forall kids. IsJSX kids => kids -> JSX
navigationMenuContent = createElement Radix.navigationMenuContent { className: "left-0 top-0 w-full md:absolute md:w-auto" }

navigationMenuLink :: forall kids. IsJSX kids => kids -> JSX
navigationMenuLink = createElement Radix.navigationMenuLink { className: "block select-none rounded-md p-3 text-sm leading-none no-underline outline-none transition-colors hover:bg-accent hover:text-accent-foreground focus:bg-accent focus:text-accent-foreground" }
