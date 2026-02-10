module ShadCN.InputOTP where

import React.Basic (JSX, ReactComponent)
import Yoga.React.DOM.HTML (div)
import Yoga.React.DOM.Internal (class IsJSX, createElement, text)

foreign import otpInput :: forall r. ReactComponent { | r }
foreign import otpSlotComp :: forall r. ReactComponent { | r }

inputOTP :: forall r. { | r } -> JSX
inputOTP props = createElement otpInput { containerClassName: "flex items-center gap-2" } ([] :: Array JSX)

inputOTPGroup :: forall kids. IsJSX kids => kids -> JSX
inputOTPGroup = div { className: "flex items-center" }

inputOTPSlot :: Int -> JSX
inputOTPSlot index = createElement otpSlotComp { index, className: "data-[active=true]:border-ring data-[active=true]:ring-ring/50 border-input relative flex h-9 w-9 items-center justify-center border-y border-r text-sm shadow-xs transition-all outline-none first:rounded-l-md first:border-l last:rounded-r-md data-[active=true]:z-10 data-[active=true]:ring-[3px]" } ([] :: Array JSX)

inputOTPSeparator :: JSX
inputOTPSeparator = div { role: "separator" } (text "-")
