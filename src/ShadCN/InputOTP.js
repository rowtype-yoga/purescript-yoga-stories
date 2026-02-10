import { OTPInput, OTPInputContext } from "input-otp"
import { createElement, useContext } from "react"

export var otpInput = OTPInput

export function otpSlotImpl(props) {
  var { index, ...rest } = props
  var ctx = useContext(OTPInputContext)
  var slot = ctx && ctx.slots ? ctx.slots[index] : {}
  var char = slot.char || ""
  var isActive = slot.isActive || false
  return createElement("div", { className: "data-[active=true]:border-ring data-[active=true]:ring-ring/50 border-input relative flex h-9 w-9 items-center justify-center border-y border-r text-sm shadow-xs transition-all outline-none first:rounded-l-md first:border-l last:rounded-r-md data-[active=true]:z-10 data-[active=true]:ring-[3px]", "data-active": isActive, ...rest }, char)
}
