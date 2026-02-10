module ShadCN.Sidebar where

import Prelude
import Data.Tuple.Nested ((/\))
import Effect (Effect)
import Effect.Unsafe (unsafePerformEffect)
import React.Basic (JSX, ReactContext, createContext, provider)
import React.Basic.DOM as R
import React.Basic.Events (handler_)
import React.Basic.Hooks as React
import Yoga.React (component)
import Yoga.React.DOM.HTML (button, div, li, ul)
import Yoga.React.DOM.Internal (class IsJSX, css)

type SidebarState = { open :: Boolean, toggle :: Effect Unit }

sidebarContext :: ReactContext SidebarState
sidebarContext = unsafePerformEffect (createContext { open: true, toggle: pure unit })

sidebarProvider :: Array JSX -> JSX
sidebarProvider kids = sidebarProviderComponent { children: kids }

sidebarProviderComponent :: { children :: Array JSX } -> JSX
sidebarProviderComponent = component "SidebarProvider" \props -> React.do
  open /\ setOpen <- React.useState' true
  let toggle = setOpen (not open)
  pure $ provider sidebarContext { open, toggle }
    [ div { className: "group/sidebar-wrapper flex min-h-svh w-full", style: css { "--sidebar-width": "16rem", "--sidebar-width-icon": "3rem" } } props.children
    ]

sidebar :: Array JSX -> JSX
sidebar kids = sidebarComponent { children: kids }

sidebarComponent :: { children :: Array JSX } -> JSX
sidebarComponent = component "Sidebar" \props -> React.do
  ctx <- React.useContext sidebarContext
  let state = if ctx.open then "expanded" else "collapsed"
  pure $ R.div { className: "group peer text-sidebar-foreground flex h-svh w-[--sidebar-width] flex-col bg-sidebar border-r transition-[width] duration-200 data-[state=collapsed]:w-[--sidebar-width-icon]", children: props.children }

sidebarTrigger :: Array JSX -> JSX
sidebarTrigger kids = sidebarTriggerComponent { children: kids }

sidebarTriggerComponent :: { children :: Array JSX } -> JSX
sidebarTriggerComponent = component "SidebarTrigger" \props -> React.do
  ctx <- React.useContext sidebarContext
  pure $ R.button { className: "inline-flex items-center justify-center rounded-md text-sm font-medium h-7 w-7", onClick: handler_ ctx.toggle, children: props.children }

sidebarHeader :: forall kids. IsJSX kids => kids -> JSX
sidebarHeader = div { className: "flex flex-col gap-2 p-2" }

sidebarContent :: forall kids. IsJSX kids => kids -> JSX
sidebarContent = div { className: "flex min-h-0 flex-1 flex-col gap-2 overflow-auto p-2" }

sidebarFooter :: forall kids. IsJSX kids => kids -> JSX
sidebarFooter = div { className: "flex flex-col gap-2 p-2" }

sidebarMenu :: forall kids. IsJSX kids => kids -> JSX
sidebarMenu = ul { className: "flex w-full min-w-0 flex-col gap-1" }

sidebarMenuItem :: forall kids. IsJSX kids => kids -> JSX
sidebarMenuItem = li { className: "group/menu-item relative" }

sidebarMenuButton :: forall kids. IsJSX kids => kids -> JSX
sidebarMenuButton = button { className: "peer/menu-button flex w-full items-center gap-2 overflow-hidden rounded-md p-2 text-left text-sm outline-none ring-sidebar-ring hover:bg-sidebar-accent hover:text-sidebar-accent-foreground focus-visible:ring-2 disabled:pointer-events-none disabled:opacity-50" }
