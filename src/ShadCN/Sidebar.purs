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

sidebarProvider :: Array JSX -> JSX
sidebarProvider kids = sidebarProviderImpl { children: kids }

sidebar :: Array JSX -> JSX
sidebar kids = sidebarImpl { children: kids }

sidebarHeader :: Array JSX -> JSX
sidebarHeader kids = sidebarHeaderImpl { children: kids }

sidebarContent :: Array JSX -> JSX
sidebarContent kids = sidebarContentImpl { children: kids }

sidebarFooter :: Array JSX -> JSX
sidebarFooter kids = sidebarFooterImpl { children: kids }

sidebarTrigger :: JSX
sidebarTrigger = sidebarTriggerImpl {}

sidebarMenu :: Array JSX -> JSX
sidebarMenu kids = sidebarMenuImpl { children: kids }

sidebarMenuItem :: Array JSX -> JSX
sidebarMenuItem kids = sidebarMenuItemImpl { children: kids }

sidebarMenuButton :: Array JSX -> JSX
sidebarMenuButton kids = sidebarMenuButtonImpl { children: kids }
