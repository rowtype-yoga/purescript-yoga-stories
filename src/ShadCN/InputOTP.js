import { OTPInput, OTPInputContext } from "input-otp"
import { createElement, useContext } from "react"

export var otpInput = OTPInput

export function otpSlotComp(props) {
  var { index, ...rest } = props
  var ctx = useContext(OTPInputContext)
  var slot = ctx && ctx.slots ? ctx.slots[index] : {}
  return createElement("div", { "data-active": slot.isActive || false, ...rest }, slot.char || "")
}
