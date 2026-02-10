module ShadCN.InputOTP where

import React.Basic (JSX, ReactComponent)
import Yoga.React.DOM.HTML (div)
import Yoga.React.DOM.Internal (class IsJSX, createElement, text)

foreign import otpInput :: forall r. ReactComponent { | r }
foreign import otpSlotImpl :: forall r. Record r -> JSX

inputOTP :: forall r. { | r } -> JSX
inputOTP props = createElement otpInput { containerClassName: "flex items-center gap-2" } ([] :: Array JSX)

inputOTPGroup :: forall kids. IsJSX kids => kids -> JSX
inputOTPGroup = div { className: "flex items-center" }

inputOTPSlot :: Int -> JSX
inputOTPSlot index = otpSlotImpl { index }

inputOTPSeparator :: JSX
inputOTPSeparator = div { role: "separator" } (text "-")
