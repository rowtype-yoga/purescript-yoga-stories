module ShadCN.Drawer where

import React.Basic (JSX, ReactComponent)
import Yoga.React.DOM.HTML (div)
import Yoga.React.DOM.Internal (class IsJSX, createElement)

foreign import drawerRoot :: forall r. ReactComponent { | r }
foreign import drawerTrigger :: forall r. ReactComponent { | r }
foreign import drawerPortal :: forall r. ReactComponent { | r }
foreign import drawerOverlay :: forall r. ReactComponent { | r }
foreign import drawerContent :: forall r. ReactComponent { | r }
foreign import drawerTitle :: forall r. ReactComponent { | r }
foreign import drawerDescription :: forall r. ReactComponent { | r }
foreign import drawerClose :: forall r. ReactComponent { | r }

drawer :: forall kids. IsJSX kids => kids -> JSX
drawer = createElement drawerRoot {}

drawerTrig :: forall kids. IsJSX kids => kids -> JSX
drawerTrig = createElement drawerTrigger {}

drawerBody :: forall kids. IsJSX kids => kids -> JSX
drawerBody kids = createElement drawerPortal {}
  [ createElement drawerOverlay { className: "data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 fixed inset-0 z-50 bg-black/50" } ([] :: Array JSX)
  , createElement drawerContent { className: "bg-background fixed z-50 flex h-auto flex-col data-[vaul-drawer-direction=bottom]:inset-x-0 data-[vaul-drawer-direction=bottom]:bottom-0 data-[vaul-drawer-direction=bottom]:mt-24 data-[vaul-drawer-direction=bottom]:max-h-[80vh] data-[vaul-drawer-direction=bottom]:rounded-t-lg data-[vaul-drawer-direction=bottom]:border-t" } kids
  ]

drawerHeader :: forall kids. IsJSX kids => kids -> JSX
drawerHeader = div { className: "flex flex-col gap-0.5 p-4 text-center md:text-left" }

drawerFooter :: forall kids. IsJSX kids => kids -> JSX
drawerFooter = div { className: "mt-auto flex flex-col gap-2 p-4" }

drawerHead :: forall kids. IsJSX kids => kids -> JSX
drawerHead = createElement drawerTitle { className: "text-foreground font-semibold" }

drawerDesc :: forall kids. IsJSX kids => kids -> JSX
drawerDesc = createElement drawerDescription { className: "text-muted-foreground text-sm" }

drawerDismiss :: forall kids. IsJSX kids => kids -> JSX
drawerDismiss = createElement drawerClose {}
