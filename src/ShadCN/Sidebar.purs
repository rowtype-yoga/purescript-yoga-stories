module ShadCN.Sidebar where

import React.Basic (JSX)

foreign import sidebarProviderImpl :: forall r. Record r -> JSX
foreign import sidebarImpl :: forall r. Record r -> JSX
foreign import sidebarHeaderImpl :: forall r. Record r -> JSX
foreign import sidebarContentImpl :: forall r. Record r -> JSX
foreign import sidebarFooterImpl :: forall r. Record r -> JSX
foreign import sidebarTriggerImpl :: forall r. Record r -> JSX
foreign import sidebarMenuImpl :: forall r. Record r -> JSX
foreign import sidebarMenuItemImpl :: forall r. Record r -> JSX
foreign import sidebarMenuButtonImpl :: forall r. Record r -> JSX

sidebarProvider :: { children :: Array JSX } -> JSX
sidebarProvider props = sidebarProviderImpl props

sidebar :: { children :: Array JSX } -> JSX
sidebar props = sidebarImpl props

sidebarHeader :: { children :: Array JSX } -> JSX
sidebarHeader props = sidebarHeaderImpl props

sidebarContent :: { children :: Array JSX } -> JSX
sidebarContent props = sidebarContentImpl props

sidebarFooter :: { children :: Array JSX } -> JSX
sidebarFooter props = sidebarFooterImpl props

sidebarTrigger :: JSX
sidebarTrigger = sidebarTriggerImpl {}

sidebarMenu :: { children :: Array JSX } -> JSX
sidebarMenu props = sidebarMenuImpl props

sidebarMenuItem :: { children :: Array JSX } -> JSX
sidebarMenuItem props = sidebarMenuItemImpl props

sidebarMenuButton :: { children :: Array JSX } -> JSX
sidebarMenuButton props = sidebarMenuButtonImpl props
