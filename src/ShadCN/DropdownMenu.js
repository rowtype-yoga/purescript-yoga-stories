import { createElement } from "react"
import { DropdownMenu as DropdownMenuPrimitive } from "radix-ui"

var contentCls = "bg-popover text-popover-foreground data-[state=open]:animate-in data-[state=closed]:animate-out data-[state=closed]:fade-out-0 data-[state=open]:fade-in-0 data-[state=closed]:zoom-out-95 data-[state=open]:zoom-in-95 z-50 min-w-[8rem] overflow-hidden rounded-md border p-1 shadow-md"
var itemCls = "focus:bg-accent focus:text-accent-foreground relative flex cursor-default items-center gap-2 rounded-sm px-2 py-1.5 text-sm outline-hidden select-none data-[disabled]:pointer-events-none data-[disabled]:opacity-50"
var separatorCls = "bg-border -mx-1 my-1 h-px"
var labelCls = "px-2 py-1.5 text-sm font-medium"

export function dropdownMenuImpl(props) {
  var { children, ...rest } = props
  return createElement(DropdownMenuPrimitive.Root, { "data-slot": "dropdown-menu", ...rest }, ...([].concat(children)))
}

export function dropdownMenuTriggerImpl(props) {
  var { children, ...rest } = props
  return createElement(DropdownMenuPrimitive.Trigger, { "data-slot": "dropdown-menu-trigger", ...rest }, ...([].concat(children)))
}

export function dropdownMenuContentImpl(props) {
  var { children, sideOffset = 6, ...rest } = props
  return createElement(
    DropdownMenuPrimitive.Portal,
    {},
    createElement(
      DropdownMenuPrimitive.Content,
      { className: contentCls, "data-slot": "dropdown-menu-content", sideOffset, ...rest },
      ...([].concat(children))
    )
  )
}

export function dropdownMenuItemImpl(props) {
  var { children, ...rest } = props
  return createElement(DropdownMenuPrimitive.Item, { className: itemCls, "data-slot": "dropdown-menu-item", ...rest }, ...([].concat(children)))
}

export function dropdownMenuSeparatorImpl(props) {
  return createElement(DropdownMenuPrimitive.Separator, { className: separatorCls, "data-slot": "dropdown-menu-separator", ...props })
}

export function dropdownMenuLabelImpl(props) {
  var { children, ...rest } = props
  return createElement(DropdownMenuPrimitive.Label, { className: labelCls, "data-slot": "dropdown-menu-label", ...rest }, ...([].concat(children)))
}
