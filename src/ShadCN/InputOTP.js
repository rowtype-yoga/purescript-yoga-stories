import { createElement, useContext } from "react"
import { OTPInput, OTPInputContext } from "input-otp"

var slotCls = "data-[active=true]:border-ring data-[active=true]:ring-ring/50 border-input relative flex h-9 w-9 items-center justify-center border-y border-r text-sm shadow-xs transition-all outline-none first:rounded-l-md first:border-l last:rounded-r-md data-[active=true]:z-10 data-[active=true]:ring-[3px]"

export function inputOTPImpl(props) {
  var { children, ...rest } = props
  return createElement(OTPInput, { "data-slot": "input-otp", containerClassName: "flex items-center gap-2", ...rest })
}
export function inputOTPGroupImpl(props) {
  var { children, ...rest } = props
  return createElement("div", { className: "flex items-center", "data-slot": "input-otp-group", ...rest }, ...([].concat(children)))
}
export function inputOTPSlotImpl(props) {
  return createElement(InputOTPSlotInner, props)
}
function InputOTPSlotInner(props) {
  var { index, ...rest } = props
  var ctx = useContext(OTPInputContext)
  var slot = ctx && ctx.slots ? ctx.slots[index] : {}
  var char = slot.char || ""
  var isActive = slot.isActive || false
  return createElement("div", { className: slotCls, "data-slot": "input-otp-slot", "data-active": isActive, ...rest }, char)
}
export function inputOTPSeparatorImpl(props) {
  return createElement("div", { role: "separator", "data-slot": "input-otp-separator", ...props }, "-")
}
