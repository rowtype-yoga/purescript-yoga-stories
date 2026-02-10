module ShadCN.InputOTP where

import Prelude hiding (div)
import Data.Array (index)
import Data.Maybe (Maybe(..), fromMaybe)
import Data.Nullable (Nullable, toMaybe)
import React.Basic (JSX, ReactComponent, ReactContext)
import React.Basic.Hooks as React
import Yoga.React (component)
import Yoga.React.DOM.HTML (div)
import Yoga.React.DOM.Internal (class IsJSX, createElement, text)

foreign import otpInput :: forall r. ReactComponent { | r }
foreign import otpInputContext :: ReactContext { slots :: Array { char :: Nullable String, isActive :: Boolean } }

inputOTP :: forall r. { | r } -> JSX
inputOTP _ = createElement otpInput { containerClassName: "flex items-center gap-2" } ([] :: Array JSX)

inputOTPGroup :: forall kids. IsJSX kids => kids -> JSX
inputOTPGroup = div { className: "flex items-center" }

inputOTPSlot :: Int -> JSX
inputOTPSlot i = inputOTPSlotComponent { index: i }

type Slot = { char :: Maybe String, isActive :: Boolean }

toSlot :: { char :: Nullable String, isActive :: Boolean } -> Slot
toSlot raw = { char: toMaybe raw.char, isActive: raw.isActive }

inputOTPSlotComponent :: { index :: Int } -> JSX
inputOTPSlotComponent = component "InputOTPSlot" \props -> React.do
  ctx <- React.useContext otpInputContext
  let slot = fromMaybe { char: Nothing, isActive: false } (toSlot <$> index ctx.slots props.index)
  let char = fromMaybe "" slot.char
  pure $ div
    { className: "data-[active=true]:border-ring data-[active=true]:ring-ring/50 border-input relative flex h-9 w-9 items-center justify-center border-y border-r text-sm shadow-xs transition-all outline-none first:rounded-l-md first:border-l last:rounded-r-md data-[active=true]:z-10 data-[active=true]:ring-[3px]"
    , "data-active": show slot.isActive
    }
    (text char)

inputOTPSeparator :: JSX
inputOTPSeparator = div { role: "separator" } (text "-")
