module ShadCN.Sidebar where

import React.Basic (JSX, ReactComponent)
import Yoga.React.DOM.HTML (div, ul, li, button)
import Yoga.React.DOM.Internal (class IsJSX, createElement)

foreign import sidebarProviderComp :: forall r. ReactComponent { | r }
foreign import sidebarComp :: forall r. ReactComponent { | r }
foreign import sidebarTriggerComp :: forall r. ReactComponent { | r }

sidebarProvider :: forall kids. IsJSX kids => kids -> JSX
sidebarProvider = createElement sidebarProviderComp { style: { "--sidebar-width": "16rem", "--sidebar-width-icon": "3rem" }, className: "group/sidebar-wrapper flex min-h-svh w-full" }

sidebar :: forall kids. IsJSX kids => kids -> JSX
sidebar = createElement sidebarComp { className: "group peer text-sidebar-foreground flex h-svh w-[--sidebar-width] flex-col bg-sidebar border-r transition-[width] duration-200 data-[state=collapsed]:w-[--sidebar-width-icon]" }

sidebarHeader :: forall kids. IsJSX kids => kids -> JSX
sidebarHeader = div { className: "flex flex-col gap-2 p-2" }

sidebarContent :: forall kids. IsJSX kids => kids -> JSX
sidebarContent = div { className: "flex min-h-0 flex-1 flex-col gap-2 overflow-auto p-2" }

sidebarFooter :: forall kids. IsJSX kids => kids -> JSX
sidebarFooter = div { className: "flex flex-col gap-2 p-2" }

sidebarTrigger :: forall kids. IsJSX kids => kids -> JSX
sidebarTrigger = createElement sidebarTriggerComp { className: "inline-flex items-center justify-center rounded-md text-sm font-medium h-7 w-7" }

sidebarMenu :: forall kids. IsJSX kids => kids -> JSX
sidebarMenu = ul { className: "flex w-full min-w-0 flex-col gap-1" }

sidebarMenuItem :: forall kids. IsJSX kids => kids -> JSX
sidebarMenuItem = li { className: "group/menu-item relative" }

sidebarMenuButton :: forall kids. IsJSX kids => kids -> JSX
sidebarMenuButton = button { className: "peer/menu-button flex w-full items-center gap-2 overflow-hidden rounded-md p-2 text-left text-sm outline-none ring-sidebar-ring hover:bg-sidebar-accent hover:text-sidebar-accent-foreground focus-visible:ring-2 disabled:pointer-events-none disabled:opacity-50" }
