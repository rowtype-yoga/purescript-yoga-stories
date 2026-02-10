module ShadCN.Carousel
  ( carousel
  , carouselItem
  , carouselPrevious
  , carouselNext
  ) where

import Prelude hiding (div)
import Data.Maybe (Maybe(..))
import Data.Nullable (Nullable, toMaybe)
import Data.Tuple.Nested (type (/\), (/\))
import Effect (Effect)
import Effect.Uncurried (EffectFn1, EffectFn2, runEffectFn1, runEffectFn2)
import Effect.Unsafe (unsafePerformEffect)
import React.Basic (JSX, ReactContext, Ref, createContext, provider)
import React.Basic.Events (handler_)
import React.Basic.Hooks (Hook, unsafeHook)
import React.Basic.Hooks as React
import Unsafe.Coerce (unsafeCoerce)
import Web.DOM.Internal.Types (Node)
import Yoga.React.DOM.HTML (button, div)
import Yoga.React.DOM.Internal (class IsJSX, createElement)

foreign import useEmblaCarouselImpl :: forall a. EffectFn2 (Ref (Nullable Node) -> Nullable EmblaApi -> a) { | EmblaOptions } a

type EmblaOptions :: Row Type
type EmblaOptions = ()

foreign import data UseEmblaCarousel :: Type -> Type
foreign import data EmblaApi :: Type

useEmblaCarousel :: Hook UseEmblaCarousel (Ref (Nullable Node) /\ Nullable EmblaApi)
useEmblaCarousel = unsafeHook (runEffectFn2 useEmblaCarouselImpl (/\) {})

foreign import scrollPrevImpl :: EffectFn1 EmblaApi Unit

scrollPrev :: EmblaApi -> Effect Unit
scrollPrev = runEffectFn1 scrollPrevImpl

foreign import scrollNextImpl :: EffectFn1 EmblaApi Unit

scrollNext :: EmblaApi -> Effect Unit
scrollNext = runEffectFn1 scrollNextImpl

foreign import canScrollPrevImpl :: EmblaApi -> Boolean
foreign import canScrollNextImpl :: EmblaApi -> Boolean

foreign import onReInitImpl :: EffectFn2 (EmblaApi -> Effect Unit) EmblaApi Unit

onReInit :: (EmblaApi -> Effect Unit) -> EmblaApi -> Effect Unit
onReInit = runEffectFn2 onReInitImpl

foreign import onSelectImpl :: EffectFn2 (EmblaApi -> Effect Unit) EmblaApi Unit

onSelect :: (EmblaApi -> Effect Unit) -> EmblaApi -> Effect Unit
onSelect = runEffectFn2 onSelectImpl

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
carousel kids = createElement carouselProviderImpl {}
  [ div { className: "relative", role: "region" }
      [ createElement carouselViewportImpl {} [ div { className: "flex" } kids ]
      ]
  ]

carouselProviderImpl :: forall r. React.ReactComponent { | r }
carouselProviderImpl = unsafeCoerce carouselProviderImpl_
  where
  carouselProviderImpl_ :: React.ReactComponent { children :: React.ReactChildren JSX }
  carouselProviderImpl_ = unsafePerformEffect $ React.reactComponentWithChildren "CarouselProvider" \props -> React.do
    ref /\ rawApi <- useEmblaCarousel
    let mbApi = toMaybe rawApi
    canPrev /\ setCanPrev <- React.useState' false
    canNext /\ setCanNext <- React.useState' false
    let
      updateNav a = do
        setCanPrev (canScrollPrevImpl a)
        setCanNext (canScrollNextImpl a)
    React.useEffectAlways do
      case mbApi of
        Nothing -> pure (pure unit)
        Just api -> do
          updateNav api
          onReInit updateNav api
          onSelect updateNav api
          pure (pure unit)
    let
      prev = case mbApi of
        Nothing -> pure unit
        Just api -> scrollPrev api
      next = case mbApi of
        Nothing -> pure unit
        Just api -> scrollNext api
    pure $ provider carouselContext { ref, canPrev, canNext, prev, next } (React.reactChildrenToArray props.children)

carouselViewportImpl :: forall r. React.ReactComponent { | r }
carouselViewportImpl = unsafeCoerce carouselViewportImpl_
  where
  carouselViewportImpl_ :: React.ReactComponent { children :: React.ReactChildren JSX }
  carouselViewportImpl_ = unsafePerformEffect $ React.reactComponentWithChildren "CarouselViewport" \props -> React.do
    ctx <- React.useContext carouselContext
    pure $ div { className: "overflow-hidden", ref: ctx.ref } (React.reactChildrenToArray props.children)

carouselItem :: forall kids. IsJSX kids => kids -> JSX
carouselItem = div { className: "min-w-0 shrink-0 grow-0 basis-full", role: "group" }

carouselPrevious :: forall kids. IsJSX kids => kids -> JSX
carouselPrevious = createElement carouselPreviousImpl
  { className: "absolute z-10 flex size-8 items-center justify-center rounded-full border bg-background shadow-sm disabled:opacity-50 -left-12 top-1/2 -translate-y-1/2"
  }

carouselPreviousImpl :: forall r. React.ReactComponent { | r }
carouselPreviousImpl = unsafeCoerce carouselPreviousImpl_
  where
  carouselPreviousImpl_ :: React.ReactComponent { children :: React.ReactChildren JSX }
  carouselPreviousImpl_ = unsafePerformEffect $ React.reactComponentWithChildren "CarouselPrevious" \props -> React.do
    ctx <- React.useContext carouselContext
    pure $ button { disabled: not ctx.canPrev, onClick: handler_ ctx.prev } (React.reactChildrenToArray props.children)

carouselNext :: forall kids. IsJSX kids => kids -> JSX
carouselNext = createElement carouselNextImpl
  { className: "absolute z-10 flex size-8 items-center justify-center rounded-full border bg-background shadow-sm disabled:opacity-50 -right-12 top-1/2 -translate-y-1/2"
  }

carouselNextImpl :: forall r. React.ReactComponent { | r }
carouselNextImpl = unsafeCoerce carouselNextImpl_
  where
  carouselNextImpl_ :: React.ReactComponent { children :: React.ReactChildren JSX }
  carouselNextImpl_ = unsafePerformEffect $ React.reactComponentWithChildren "CarouselNext" \props -> React.do
    ctx <- React.useContext carouselContext
    pure $ button { disabled: not ctx.canNext, onClick: handler_ ctx.next } (React.reactChildrenToArray props.children)
