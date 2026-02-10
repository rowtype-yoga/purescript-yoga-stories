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
export const accordionRoot = Accordion.Root
export const accordionItem = Accordion.Item
export const accordionHeader = Accordion.Header
export const accordionTrigger = Accordion.Trigger
export const accordionContent = Accordion.Content

// AspectRatio
export const aspectRatioRoot = AspectRatio.Root

// Avatar
export const avatarRoot = Avatar.Root
export const avatarImage = Avatar.Image
export const avatarFallback = Avatar.Fallback

// Checkbox
export const checkboxRoot = Checkbox.Root
export const checkboxIndicator = Checkbox.Indicator

// Collapsible
export const collapsibleRoot = Collapsible.Root
export const collapsibleTrigger = Collapsible.Trigger
export const collapsibleContent = Collapsible.Content

// ContextMenu
export const contextMenuRoot = ContextMenu.Root
export const contextMenuTrigger = ContextMenu.Trigger
export const contextMenuPortal = ContextMenu.Portal
export const contextMenuContent = ContextMenu.Content
export const contextMenuItem = ContextMenu.Item
export const contextMenuSeparator = ContextMenu.Separator
export const contextMenuLabel = ContextMenu.Label

// Dialog
export const dialogRoot = Dialog.Root
export const dialogTrigger = Dialog.Trigger
export const dialogPortal = Dialog.Portal
export const dialogOverlay = Dialog.Overlay
export const dialogContent = Dialog.Content
export const dialogTitle = Dialog.Title
export const dialogDescription = Dialog.Description
export const dialogClose = Dialog.Close

// DropdownMenu
export const dropdownMenuRoot = DropdownMenu.Root
export const dropdownMenuTrigger = DropdownMenu.Trigger
export const dropdownMenuPortal = DropdownMenu.Portal
export const dropdownMenuContent = DropdownMenu.Content
export const dropdownMenuItem = DropdownMenu.Item
export const dropdownMenuSeparator = DropdownMenu.Separator
export const dropdownMenuLabel = DropdownMenu.Label

// HoverCard
export const hoverCardRoot = HoverCard.Root
export const hoverCardTrigger = HoverCard.Trigger
export const hoverCardPortal = HoverCard.Portal
export const hoverCardContent = HoverCard.Content

// Label
export const labelRoot = Label.Root

// Menubar
export const menubarRoot = Menubar.Root
export const menubarMenu = Menubar.Menu
export const menubarTrigger = Menubar.Trigger
export const menubarPortal = Menubar.Portal
export const menubarContent = Menubar.Content
export const menubarItem = Menubar.Item
export const menubarSeparator = Menubar.Separator

// NavigationMenu
export const navigationMenuRoot = NavigationMenu.Root
export const navigationMenuList = NavigationMenu.List
export const navigationMenuItem = NavigationMenu.Item
export const navigationMenuTrigger = NavigationMenu.Trigger
export const navigationMenuContent = NavigationMenu.Content
export const navigationMenuLink = NavigationMenu.Link
export const navigationMenuViewport = NavigationMenu.Viewport

// Popover
export const popoverRoot = Popover.Root
export const popoverTrigger = Popover.Trigger
export const popoverPortal = Popover.Portal
export const popoverContent = Popover.Content

// Progress
export const progressRoot = Progress.Root
export const progressIndicator = Progress.Indicator

// RadioGroup
export const radioGroupRoot = RadioGroup.Root
export const radioGroupItem = RadioGroup.Item
export const radioGroupIndicator = RadioGroup.Indicator

// ScrollArea
export const scrollAreaRoot = ScrollArea.Root
export const scrollAreaViewport = ScrollArea.Viewport
export const scrollAreaScrollbar = ScrollArea.Scrollbar
export const scrollAreaThumb = ScrollArea.Thumb
export const scrollAreaCorner = ScrollArea.Corner

// Select
export const selectRoot = Select.Root
export const selectTrigger = Select.Trigger
export const selectValue = Select.Value
export const selectIcon = Select.Icon
export const selectPortal = Select.Portal
export const selectContent = Select.Content
export const selectViewport = Select.Viewport
export const selectItem = Select.Item
export const selectItemText = Select.ItemText
export const selectItemIndicator = Select.ItemIndicator
export const selectGroup = Select.Group
export const selectLabel = Select.Label
export const selectSeparator = Select.Separator

// Separator
export const separatorRoot = Separator.Root

// Slider
export const sliderRoot = Slider.Root
export const sliderTrack = Slider.Track
export const sliderRange = Slider.Range
export const sliderThumb = Slider.Thumb

// Switch
export const switchRoot = Switch.Root
export const switchThumb = Switch.Thumb

// Tabs
export const tabsRoot = Tabs.Root
export const tabsList = Tabs.List
export const tabsTrigger = Tabs.Trigger
export const tabsContent = Tabs.Content

// Toggle
export const toggleRoot = Toggle.Root

// ToggleGroup
export const toggleGroupRoot = ToggleGroup.Root
export const toggleGroupItem = ToggleGroup.Item

// Tooltip
export const tooltipProvider = Tooltip.Provider
export const tooltipRoot = Tooltip.Root
export const tooltipTrigger = Tooltip.Trigger
export const tooltipPortal = Tooltip.Portal
export const tooltipContent = Tooltip.Content

// Utility
export function unsafeShowNumber(n) { return String(n) }
