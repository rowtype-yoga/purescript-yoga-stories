import { Accordion } from "radix-ui"
import { AspectRatio } from "radix-ui"
import { Avatar } from "radix-ui"
import { Checkbox } from "radix-ui"
import { Collapsible } from "radix-ui"
import { ContextMenu } from "radix-ui"
import { Dialog } from "radix-ui"
import { DropdownMenu } from "radix-ui"
import { HoverCard } from "radix-ui"
import { Label } from "radix-ui"
import { Menubar } from "radix-ui"
import { NavigationMenu } from "radix-ui"
import { Popover } from "radix-ui"
import { Progress } from "radix-ui"
import { RadioGroup } from "radix-ui"
import { ScrollArea } from "radix-ui"
import { Select } from "radix-ui"
import { Separator } from "radix-ui"
import { Slider } from "radix-ui"
import { Switch } from "radix-ui"
import { Tabs } from "radix-ui"
import { Toggle } from "radix-ui"
import { ToggleGroup } from "radix-ui"
import { Tooltip } from "radix-ui"

// Accordion
export var accordionRoot = Accordion.Root
export var accordionItem = Accordion.Item
export var accordionHeader = Accordion.Header
export var accordionTrigger = Accordion.Trigger
export var accordionContent = Accordion.Content

// AspectRatio
export var aspectRatioRoot = AspectRatio.Root

// Avatar
export var avatarRoot = Avatar.Root
export var avatarImage = Avatar.Image
export var avatarFallback = Avatar.Fallback

// Checkbox
export var checkboxRoot = Checkbox.Root
export var checkboxIndicator = Checkbox.Indicator

// Collapsible
export var collapsibleRoot = Collapsible.Root
export var collapsibleTrigger = Collapsible.Trigger
export var collapsibleContent = Collapsible.Content

// ContextMenu
export var contextMenuRoot = ContextMenu.Root
export var contextMenuTrigger = ContextMenu.Trigger
export var contextMenuPortal = ContextMenu.Portal
export var contextMenuContent = ContextMenu.Content
export var contextMenuItem = ContextMenu.Item
export var contextMenuSeparator = ContextMenu.Separator
export var contextMenuLabel = ContextMenu.Label

// Dialog
export var dialogRoot = Dialog.Root
export var dialogTrigger = Dialog.Trigger
export var dialogPortal = Dialog.Portal
export var dialogOverlay = Dialog.Overlay
export var dialogContent = Dialog.Content
export var dialogTitle = Dialog.Title
export var dialogDescription = Dialog.Description
export var dialogClose = Dialog.Close

// DropdownMenu
export var dropdownMenuRoot = DropdownMenu.Root
export var dropdownMenuTrigger = DropdownMenu.Trigger
export var dropdownMenuPortal = DropdownMenu.Portal
export var dropdownMenuContent = DropdownMenu.Content
export var dropdownMenuItem = DropdownMenu.Item
export var dropdownMenuSeparator = DropdownMenu.Separator
export var dropdownMenuLabel = DropdownMenu.Label

// HoverCard
export var hoverCardRoot = HoverCard.Root
export var hoverCardTrigger = HoverCard.Trigger
export var hoverCardPortal = HoverCard.Portal
export var hoverCardContent = HoverCard.Content

// Label
export var labelRoot = Label.Root

// Menubar
export var menubarRoot = Menubar.Root
export var menubarMenu = Menubar.Menu
export var menubarTrigger = Menubar.Trigger
export var menubarPortal = Menubar.Portal
export var menubarContent = Menubar.Content
export var menubarItem = Menubar.Item
export var menubarSeparator = Menubar.Separator

// NavigationMenu
export var navigationMenuRoot = NavigationMenu.Root
export var navigationMenuList = NavigationMenu.List
export var navigationMenuItem = NavigationMenu.Item
export var navigationMenuTrigger = NavigationMenu.Trigger
export var navigationMenuContent = NavigationMenu.Content
export var navigationMenuLink = NavigationMenu.Link
export var navigationMenuViewport = NavigationMenu.Viewport

// Popover
export var popoverRoot = Popover.Root
export var popoverTrigger = Popover.Trigger
export var popoverPortal = Popover.Portal
export var popoverContent = Popover.Content

// Progress
export var progressRoot = Progress.Root
export var progressIndicator = Progress.Indicator

// RadioGroup
export var radioGroupRoot = RadioGroup.Root
export var radioGroupItem = RadioGroup.Item
export var radioGroupIndicator = RadioGroup.Indicator

// ScrollArea
export var scrollAreaRoot = ScrollArea.Root
export var scrollAreaViewport = ScrollArea.Viewport
export var scrollAreaScrollbar = ScrollArea.Scrollbar
export var scrollAreaThumb = ScrollArea.Thumb
export var scrollAreaCorner = ScrollArea.Corner

// Select
export var selectRoot = Select.Root
export var selectTrigger = Select.Trigger
export var selectValue = Select.Value
export var selectIcon = Select.Icon
export var selectPortal = Select.Portal
export var selectContent = Select.Content
export var selectViewport = Select.Viewport
export var selectItem = Select.Item
export var selectItemText = Select.ItemText
export var selectItemIndicator = Select.ItemIndicator
export var selectGroup = Select.Group
export var selectLabel = Select.Label
export var selectSeparator = Select.Separator

// Separator
export var separatorRoot = Separator.Root

// Slider
export var sliderRoot = Slider.Root
export var sliderTrack = Slider.Track
export var sliderRange = Slider.Range
export var sliderThumb = Slider.Thumb

// Switch
export var switchRoot = Switch.Root
export var switchThumb = Switch.Thumb

// Tabs
export var tabsRoot = Tabs.Root
export var tabsList = Tabs.List
export var tabsTrigger = Tabs.Trigger
export var tabsContent = Tabs.Content

// Toggle
export var toggleRoot = Toggle.Root

// ToggleGroup
export var toggleGroupRoot = ToggleGroup.Root
export var toggleGroupItem = ToggleGroup.Item

// Tooltip
export var tooltipProvider = Tooltip.Provider
export var tooltipRoot = Tooltip.Root
export var tooltipTrigger = Tooltip.Trigger
export var tooltipPortal = Tooltip.Portal
export var tooltipContent = Tooltip.Content

// Utility
export function unsafeShowNumber(n) { return String(n) }
