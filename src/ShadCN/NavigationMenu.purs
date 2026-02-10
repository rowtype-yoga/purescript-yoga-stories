module ShadCN.NavigationMenu where

import React.Basic (JSX, element)
import ShadCN.Radix as Radix

navigationMenu :: Array JSX -> JSX
navigationMenu kids = element Radix.navigationMenuRoot { className: "relative flex max-w-max flex-1 items-center justify-center", children: kids }

navigationMenuList :: Array JSX -> JSX
navigationMenuList kids = element Radix.navigationMenuList { className: "group flex flex-1 list-none items-center justify-center gap-1", children: kids }

navigationMenuItem :: Array JSX -> JSX
navigationMenuItem kids = element Radix.navigationMenuItem { children: kids }

navigationMenuTrigger :: Array JSX -> JSX
navigationMenuTrigger kids = element Radix.navigationMenuTrigger { className: "group inline-flex h-9 w-max items-center justify-center rounded-md bg-background px-4 py-2 text-sm font-medium hover:bg-accent hover:text-accent-foreground focus:bg-accent focus:text-accent-foreground focus:outline-none disabled:pointer-events-none disabled:opacity-50", children: kids }

navigationMenuContent :: Array JSX -> JSX
navigationMenuContent kids = element Radix.navigationMenuContent { className: "left-0 top-0 w-full md:absolute md:w-auto", children: kids }

navigationMenuLink :: Array JSX -> JSX
navigationMenuLink kids = element Radix.navigationMenuLink { className: "block select-none rounded-md p-3 text-sm leading-none no-underline outline-none transition-colors hover:bg-accent hover:text-accent-foreground focus:bg-accent focus:text-accent-foreground", children: kids }
