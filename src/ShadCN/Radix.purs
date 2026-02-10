module ShadCN.Radix where

import React.Basic (ReactComponent)

-- Accordion
foreign import accordionRoot :: forall r. ReactComponent { | r }
foreign import accordionItem :: forall r. ReactComponent { | r }
foreign import accordionHeader :: forall r. ReactComponent { | r }
foreign import accordionTrigger :: forall r. ReactComponent { | r }
foreign import accordionContent :: forall r. ReactComponent { | r }

-- AspectRatio
foreign import aspectRatioRoot :: forall r. ReactComponent { | r }

-- Avatar
foreign import avatarRoot :: forall r. ReactComponent { | r }
foreign import avatarImage :: forall r. ReactComponent { | r }
foreign import avatarFallback :: forall r. ReactComponent { | r }

-- Checkbox
foreign import checkboxRoot :: forall r. ReactComponent { | r }
foreign import checkboxIndicator :: forall r. ReactComponent { | r }

-- Collapsible
foreign import collapsibleRoot :: forall r. ReactComponent { | r }
foreign import collapsibleTrigger :: forall r. ReactComponent { | r }
foreign import collapsibleContent :: forall r. ReactComponent { | r }

-- ContextMenu
foreign import contextMenuRoot :: forall r. ReactComponent { | r }
foreign import contextMenuTrigger :: forall r. ReactComponent { | r }
foreign import contextMenuPortal :: forall r. ReactComponent { | r }
foreign import contextMenuContent :: forall r. ReactComponent { | r }
foreign import contextMenuItem :: forall r. ReactComponent { | r }
foreign import contextMenuSeparator :: forall r. ReactComponent { | r }
foreign import contextMenuLabel :: forall r. ReactComponent { | r }

-- Dialog
foreign import dialogRoot :: forall r. ReactComponent { | r }
foreign import dialogTrigger :: forall r. ReactComponent { | r }
foreign import dialogPortal :: forall r. ReactComponent { | r }
foreign import dialogOverlay :: forall r. ReactComponent { | r }
foreign import dialogContent :: forall r. ReactComponent { | r }
foreign import dialogTitle :: forall r. ReactComponent { | r }
foreign import dialogDescription :: forall r. ReactComponent { | r }
foreign import dialogClose :: forall r. ReactComponent { | r }

-- DropdownMenu
foreign import dropdownMenuRoot :: forall r. ReactComponent { | r }
foreign import dropdownMenuTrigger :: forall r. ReactComponent { | r }
foreign import dropdownMenuPortal :: forall r. ReactComponent { | r }
foreign import dropdownMenuContent :: forall r. ReactComponent { | r }
foreign import dropdownMenuItem :: forall r. ReactComponent { | r }
foreign import dropdownMenuSeparator :: forall r. ReactComponent { | r }
foreign import dropdownMenuLabel :: forall r. ReactComponent { | r }

-- HoverCard
foreign import hoverCardRoot :: forall r. ReactComponent { | r }
foreign import hoverCardTrigger :: forall r. ReactComponent { | r }
foreign import hoverCardPortal :: forall r. ReactComponent { | r }
foreign import hoverCardContent :: forall r. ReactComponent { | r }

-- Label
foreign import labelRoot :: forall r. ReactComponent { | r }

-- Menubar
foreign import menubarRoot :: forall r. ReactComponent { | r }
foreign import menubarMenu :: forall r. ReactComponent { | r }
foreign import menubarTrigger :: forall r. ReactComponent { | r }
foreign import menubarPortal :: forall r. ReactComponent { | r }
foreign import menubarContent :: forall r. ReactComponent { | r }
foreign import menubarItem :: forall r. ReactComponent { | r }
foreign import menubarSeparator :: forall r. ReactComponent { | r }

-- NavigationMenu
foreign import navigationMenuRoot :: forall r. ReactComponent { | r }
foreign import navigationMenuList :: forall r. ReactComponent { | r }
foreign import navigationMenuItem :: forall r. ReactComponent { | r }
foreign import navigationMenuTrigger :: forall r. ReactComponent { | r }
foreign import navigationMenuContent :: forall r. ReactComponent { | r }
foreign import navigationMenuLink :: forall r. ReactComponent { | r }
foreign import navigationMenuViewport :: forall r. ReactComponent { | r }

-- Popover
foreign import popoverRoot :: forall r. ReactComponent { | r }
foreign import popoverTrigger :: forall r. ReactComponent { | r }
foreign import popoverPortal :: forall r. ReactComponent { | r }
foreign import popoverContent :: forall r. ReactComponent { | r }

-- Progress
foreign import progressRoot :: forall r. ReactComponent { | r }
foreign import progressIndicator :: forall r. ReactComponent { | r }

-- RadioGroup
foreign import radioGroupRoot :: forall r. ReactComponent { | r }
foreign import radioGroupItem :: forall r. ReactComponent { | r }
foreign import radioGroupIndicator :: forall r. ReactComponent { | r }

-- ScrollArea
foreign import scrollAreaRoot :: forall r. ReactComponent { | r }
foreign import scrollAreaViewport :: forall r. ReactComponent { | r }
foreign import scrollAreaScrollbar :: forall r. ReactComponent { | r }
foreign import scrollAreaThumb :: forall r. ReactComponent { | r }
foreign import scrollAreaCorner :: forall r. ReactComponent { | r }

-- Select
foreign import selectRoot :: forall r. ReactComponent { | r }
foreign import selectTrigger :: forall r. ReactComponent { | r }
foreign import selectValue :: forall r. ReactComponent { | r }
foreign import selectIcon :: forall r. ReactComponent { | r }
foreign import selectPortal :: forall r. ReactComponent { | r }
foreign import selectContent :: forall r. ReactComponent { | r }
foreign import selectViewport :: forall r. ReactComponent { | r }
foreign import selectItem :: forall r. ReactComponent { | r }
foreign import selectItemText :: forall r. ReactComponent { | r }
foreign import selectItemIndicator :: forall r. ReactComponent { | r }
foreign import selectGroup :: forall r. ReactComponent { | r }
foreign import selectLabel :: forall r. ReactComponent { | r }
foreign import selectSeparator :: forall r. ReactComponent { | r }

-- Separator
foreign import separatorRoot :: forall r. ReactComponent { | r }

-- Slider
foreign import sliderRoot :: forall r. ReactComponent { | r }
foreign import sliderTrack :: forall r. ReactComponent { | r }
foreign import sliderRange :: forall r. ReactComponent { | r }
foreign import sliderThumb :: forall r. ReactComponent { | r }

-- Switch
foreign import switchRoot :: forall r. ReactComponent { | r }
foreign import switchThumb :: forall r. ReactComponent { | r }

-- Tabs
foreign import tabsRoot :: forall r. ReactComponent { | r }
foreign import tabsList :: forall r. ReactComponent { | r }
foreign import tabsTrigger :: forall r. ReactComponent { | r }
foreign import tabsContent :: forall r. ReactComponent { | r }

-- Toggle
foreign import toggleRoot :: forall r. ReactComponent { | r }

-- ToggleGroup
foreign import toggleGroupRoot :: forall r. ReactComponent { | r }
foreign import toggleGroupItem :: forall r. ReactComponent { | r }

-- Tooltip
foreign import tooltipProvider :: forall r. ReactComponent { | r }
foreign import tooltipRoot :: forall r. ReactComponent { | r }
foreign import tooltipTrigger :: forall r. ReactComponent { | r }
foreign import tooltipPortal :: forall r. ReactComponent { | r }
foreign import tooltipContent :: forall r. ReactComponent { | r }
