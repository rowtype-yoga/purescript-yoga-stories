module ShadCN.Carousel where

import Prelude hiding (div)
import Data.Maybe (Maybe(..))
import Data.Nullable (Nullable, toMaybe)
import Data.Tuple.Nested (type (/\), (/\))
import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn2, EffectFn3, runEffectFn1, runEffectFn2, runEffectFn3)
import Effect.Unsafe (unsafePerformEffect)
import React.Basic (JSX, ReactContext, Ref, createContext, provider)
import React.Basic.Events (handler_)
import React.Basic.Hooks (Hook, unsafeHook)
import React.Basic.Hooks as React
import Unsafe.Coerce (unsafeCoerce)
import Web.DOM.Internal.Types (Node)
import Yoga.React (component)
import Yoga.React.DOM.HTML (button, div)
import Yoga.React.DOM.Internal (class IsJSX)

foreign import useEmblaCarouselImpl :: forall a. EffectFn2 (Ref (Nullable Node) -> Nullable EmblaApi -> a) { | EmblaOptions } a

type EmblaOptions :: Row Type
type EmblaOptions = ()

foreign import data UseEmblaCarousel :: Type -> Type
foreign import data EmblaApi :: Type

useEmblaCarousel :: Hook UseEmblaCarousel (Ref (Nullable Node) /\ Nullable EmblaApi)
useEmblaCarousel = unsafeHook (runEffectFn2 useEmblaCarouselImpl (/\) {})

foreign import scrollPrevImpl :: EffectFn1 EmblaApi Unit
foreign import scrollNextImpl :: EffectFn1 EmblaApi Unit
foreign import canScrollPrevImpl :: EmblaApi -> Boolean
foreign import canScrollNextImpl :: EmblaApi -> Boolean
foreign import onImpl :: EffectFn3 String (EmblaApi -> Effect Unit) EmblaApi Unit

type CarouselCtx =
  { ref :: Ref (Nullable Node)
  , canPrev :: Boolean
  , canNext :: Boolean
  , prev :: Effect Unit
  , next :: Effect Unit
  }

carouselContext :: ReactContext CarouselCtx
carouselContext = unsafePerformEffect do
  createContext { ref: unsafeCoerce unit, canPrev: false, canNext: false, prev: pure unit, next: pure unit }

carousel :: forall kids. IsJSX kids => kids -> JSX
carousel kids = carouselProviderComponent
  { children:
      [ div { className: "relative", role: "region" }
          [ carouselViewportComponent { children: [ div { className: "flex" } kids ] }
          ]
      ]
  }

carouselProviderComponent :: { children :: Array JSX } -> JSX
carouselProviderComponent = component "CarouselProvider" \props -> React.do
  ref /\ rawApi <- useEmblaCarousel
  let mbApi = toMaybe rawApi
  canPrev /\ setCanPrev <- React.useState' false
  canNext /\ setCanNext <- React.useState' false
  let
    onSelect a = do
      setCanPrev (canScrollPrevImpl a)
      setCanNext (canScrollNextImpl a)
  React.useEffectAlways do
    case mbApi of
      Nothing -> pure (pure unit)
      Just api -> do
        onSelect api
        runEffectFn3 onImpl "reInit" onSelect api
        runEffectFn3 onImpl "select" onSelect api
        pure (pure unit)
  let
    prev = case mbApi of
      Nothing -> pure unit
      Just api -> runEffectFn1 scrollPrevImpl api
    next = case mbApi of
      Nothing -> pure unit
      Just api -> runEffectFn1 scrollNextImpl api
  pure $ provider carouselContext { ref, canPrev, canNext, prev, next } props.children

carouselViewportComponent :: { children :: Array JSX } -> JSX
carouselViewportComponent = component "CarouselViewport" \props -> React.do
  ctx <- React.useContext carouselContext
  pure $ div { className: "overflow-hidden", ref: ctx.ref } props.children

carouselItem :: forall kids. IsJSX kids => kids -> JSX
carouselItem = div { className: "min-w-0 shrink-0 grow-0 basis-full", role: "group" }

carouselPrevious :: Array JSX -> JSX
carouselPrevious kids = carouselPreviousComponent { children: kids }

carouselPreviousComponent :: { children :: Array JSX } -> JSX
carouselPreviousComponent = component "CarouselPrevious" \props -> React.do
  ctx <- React.useContext carouselContext
  pure $ button
    { className: "absolute z-10 flex size-8 items-center justify-center rounded-full border bg-background shadow-sm disabled:opacity-50 -left-12 top-1/2 -translate-y-1/2"
    , disabled: not ctx.canPrev
    , onClick: handler_ ctx.prev
    }
    props.children

carouselNext :: Array JSX -> JSX
carouselNext kids = carouselNextComponent { children: kids }

carouselNextComponent :: { children :: Array JSX } -> JSX
carouselNextComponent = component "CarouselNext" \props -> React.do
  ctx <- React.useContext carouselContext
  pure $ button
    { className: "absolute z-10 flex size-8 items-center justify-center rounded-full border bg-background shadow-sm disabled:opacity-50 -right-12 top-1/2 -translate-y-1/2"
    , disabled: not ctx.canNext
    , onClick: handler_ ctx.next
    }
    props.children
