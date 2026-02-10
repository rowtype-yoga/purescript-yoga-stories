import { createElement } from "react"
import { Switch as SwitchPrimitive } from "radix-ui"

var rootCls = "peer data-[state=checked]:bg-primary data-[state=unchecked]:bg-input focus-visible:border-ring focus-visible:ring-ring/50 dark:data-[state=unchecked]:bg-input/80 inline-flex shrink-0 items-center rounded-full border border-transparent shadow-xs transition-all outline-none focus-visible:ring-[3px] disabled:cursor-not-allowed disabled:opacity-50 h-[1.15rem] w-8"
var thumbCls = "bg-background dark:data-[state=unchecked]:bg-foreground dark:data-[state=checked]:bg-primary-foreground pointer-events-none block rounded-full ring-0 transition-transform size-4 data-[state=checked]:translate-x-[calc(100%-2px)] data-[state=unchecked]:translate-x-0"

export function switchImpl(props) {
  var { ...rest } = props
  return createElement(
    SwitchPrimitive.Root,
    { className: rootCls, "data-slot": "switch", ...rest },
    createElement(SwitchPrimitive.Thumb, { className: thumbCls, "data-slot": "switch-thumb" })
  )
}
