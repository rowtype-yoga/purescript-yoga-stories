module ShadCN.InputOTP where

import React.Basic (JSX)

foreign import inputOTPImpl :: forall r. Record r -> JSX
foreign import inputOTPGroupImpl :: forall r. Record r -> JSX
foreign import inputOTPSlotImpl :: forall r. Record r -> JSX
foreign import inputOTPSeparatorImpl :: forall r. Record r -> JSX

inputOTP :: forall r. Record r -> JSX
inputOTP props = inputOTPImpl props

inputOTPGroup :: Array JSX -> JSX
inputOTPGroup kids = inputOTPGroupImpl { children: kids }

inputOTPSlot :: { index :: Int } -> JSX
inputOTPSlot props = inputOTPSlotImpl props

inputOTPSeparator :: {} -> JSX
inputOTPSeparator props = inputOTPSeparatorImpl props
