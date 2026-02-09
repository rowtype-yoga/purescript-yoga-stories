module YogaStories.Controls
  ( class InitialValue
  , initialValue
  , class RenderControl
  , renderControl
  , class InitialValues
  , initialValues
  , class RenderControls
  , renderControls
  , buildInitialValues
  , controlsPanel
  , class GenericToString
  , genericToString
  , class GenericFromString
  , genericFromString
  , module YogaStories.Controls.Types
  ) where

import Prelude

import Data.Generic.Rep (class Generic, Constructor(..), NoArguments(..), Sum(Inl, Inr), from, to)
import Data.Maybe (Maybe(..))
import Data.Symbol (class IsSymbol, reflectSymbol)
import Effect (Effect)
import Prim.Row as Row
import Prim.RowList (class RowToList, Cons, Nil, RowList)
import React.Basic (JSX)
import React.Basic.DOM as R
import React.Basic.DOM.Events (targetChecked, targetValue)
import React.Basic.Events (handler)
import Record (get, set)
import Record.Builder (Builder)
import Record.Builder as Builder
import Type.Proxy (Proxy(..))
import Yoga.React.DOM.HTML (div, label, option)
import Yoga.React.DOM.HTML.Select as HtmlSelect
import Yoga.React.DOM.Internal (text)
import YogaStories.Controls.Types (class EnumOptions, class GenericEnumOptions, Color(..), Enum(..), Select(..), Slider(..), color, enum, enumOptions, genericEnumOptions, select, slider)

-- FFI
foreign import inputImpl :: forall r. Record r -> JSX
foreign import parseFloat_ :: String -> Number
foreign import parseInt_ :: String -> Int

-- InitialValue: extract the default value from a control descriptor

class InitialValue :: Type -> Type -> Constraint
class InitialValue schema value | schema -> value where
  initialValue :: schema -> value

instance InitialValue String String where
  initialValue = identity

instance InitialValue Number Number where
  initialValue = identity

instance InitialValue Int Int where
  initialValue = identity

instance InitialValue Boolean Boolean where
  initialValue = identity

instance InitialValue Slider Number where
  initialValue (Slider s) = s.value

instance InitialValue (Select String) String where
  initialValue (Select s) = s.value

instance InitialValue Color String where
  initialValue (Color s) = s

instance InitialValue (Enum a) a where
  initialValue (Enum e) = e.value

instance InitialValue (Maybe String) (Maybe String) where
  initialValue = identity

instance InitialValue (Maybe Number) (Maybe Number) where
  initialValue = identity

instance InitialValue (Maybe Int) (Maybe Int) where
  initialValue = identity

instance InitialValue (Maybe Boolean) (Maybe Boolean) where
  initialValue = identity

-- InitialValues: extract initial values from a whole schema record

class InitialValues :: RowList Type -> Row Type -> Row Type -> Row Type -> Constraint
class InitialValues rl schemaRow from to | rl -> schemaRow from to where
  initialValues :: forall g. g rl -> Record schemaRow -> Builder (Record from) (Record to)

instance InitialValues Nil schemaRow () () where
  initialValues _ _ = identity

instance
  ( IsSymbol name
  , InitialValue schemaType valueType
  , InitialValues tail schemaRow from from'
  , Row.Cons name schemaType whatever schemaRow
  , Row.Lacks name from'
  , Row.Cons name valueType from' to
  ) =>
  InitialValues (Cons name schemaType tail) schemaRow from to where
  initialValues _ schema = Builder.insert nameP val <<< rest
    where
    nameP = Proxy :: Proxy name
    val = initialValue (get nameP schema)
    rest = initialValues (Proxy :: Proxy tail) schema

-- RenderControl: render an appropriate HTML input for each schema type

class RenderControl :: Type -> Type -> Constraint
class RenderControl schema value | schema -> value where
  renderControl :: schema -> String -> value -> (value -> Effect Unit) -> JSX

instance RenderControl String String where
  renderControl _ lbl val setter = controlRow lbl
    [ inputImpl
        { type: "text"
        , value: val
        , className: inputClass
        , onChange: handler targetValue \v -> case v of
            Just s -> setter s
            Nothing -> pure unit
        }
    ]

instance RenderControl Number Number where
  renderControl _ lbl val setter = controlRow lbl
    [ inputImpl
        { type: "number"
        , value: show val
        , className: inputClass
        , step: "any"
        , onChange: handler targetValue \v -> case v of
            Just s -> do
              let n = parseFloat_ s
              when (n == n) (setter n)
            Nothing -> pure unit
        }
    ]

instance RenderControl Int Int where
  renderControl _ lbl val setter = controlRow lbl
    [ inputImpl
        { type: "number"
        , value: show val
        , className: inputClass
        , step: "1"
        , onChange: handler targetValue \v -> case v of
            Just s -> do
              let n = parseInt_ s
              when (n == n) (setter n)
            Nothing -> pure unit
        }
    ]

instance RenderControl Boolean Boolean where
  renderControl _ lbl val setter = controlRow lbl
    [ inputImpl
        { type: "checkbox"
        , checked: val
        , className: "accent-indigo-500"
        , onChange: handler targetChecked \v -> case v of
            Just b -> setter b
            Nothing -> pure unit
        }
    ]

instance RenderControl Slider Number where
  renderControl (Slider s) lbl val setter = controlRow lbl
    [ div { className: "flex items-center gap-2 flex-1" }
        [ inputImpl
            { type: "range"
            , min: show s.min
            , max: show s.max
            , step: show s.step
            , value: show val
            , className: "flex-1 accent-indigo-500"
            , onChange: handler targetValue \v -> case v of
                Just str -> do
                  let n = parseFloat_ str
                  when (n == n) (setter n)
                Nothing -> pure unit
            }
        , R.span { className: "text-xs text-slate-400 w-12 text-right", children: [ R.text (show val) ] }
        ]
    ]

instance RenderControl (Select String) String where
  renderControl (Select s) lbl val setter = controlRow lbl
    [ HtmlSelect.select
        { value: val
        , className: inputClass
        , onChange: handler targetValue \v -> case v of
            Just str -> setter str
            Nothing -> pure unit
        }
        (map (\opt -> option { value: opt } (text opt)) s.options)
    ]

instance RenderControl Color String where
  renderControl _ lbl val setter = controlRow lbl
    [ inputImpl
        { type: "color"
        , value: val
        , className: "w-8 h-8 rounded border border-slate-600 bg-transparent cursor-pointer"
        , onChange: handler targetValue \v -> case v of
            Just s -> setter s
            Nothing -> pure unit
        }
    , R.span { className: "text-xs text-slate-400 ml-2", children: [ R.text val ] }
    ]

instance (Generic a rep, GenericToString rep, GenericFromString rep, EnumOptions a) => RenderControl (Enum a) a where
  renderControl _ lbl val setter = controlRow lbl
    [ HtmlSelect.select
        { value: genericToString (from val)
        , className: inputClass
        , onChange: handler targetValue \v -> case v of
            Just str -> case to <$> genericFromString str of
              Just a -> setter a
              Nothing -> pure unit
            Nothing -> pure unit
        }
        (map (\opt -> option { value: opt } (text opt)) (enumOptions (Proxy :: Proxy a)))
    ]

instance RenderControl (Maybe String) (Maybe String) where
  renderControl _ lbl val setter = controlRow lbl
    [ inputImpl
        { type: "checkbox"
        , checked: isJust val
        , className: "accent-indigo-500 mr-2"
        , onChange: handler targetChecked \v -> case v of
            Just true -> setter (Just "")
            _ -> setter Nothing
        }
    , case val of
        Nothing -> R.text ""
        Just s -> inputImpl
          { type: "text"
          , value: s
          , className: inputClass
          , onChange: handler targetValue \v -> case v of
              Just str -> setter (Just str)
              Nothing -> pure unit
          }
    ]

instance RenderControl (Maybe Number) (Maybe Number) where
  renderControl _ lbl val setter = controlRow lbl
    [ inputImpl
        { type: "checkbox"
        , checked: isJust val
        , className: "accent-indigo-500 mr-2"
        , onChange: handler targetChecked \v -> case v of
            Just true -> setter (Just 0.0)
            _ -> setter Nothing
        }
    , case val of
        Nothing -> R.text ""
        Just n -> inputImpl
          { type: "number"
          , value: show n
          , step: "any"
          , className: inputClass
          , onChange: handler targetValue \v -> case v of
              Just str -> do
                let num = parseFloat_ str
                when (num == num) (setter (Just num))
              Nothing -> pure unit
          }
    ]

instance RenderControl (Maybe Int) (Maybe Int) where
  renderControl _ lbl val setter = controlRow lbl
    [ inputImpl
        { type: "checkbox"
        , checked: isJust val
        , className: "accent-indigo-500 mr-2"
        , onChange: handler targetChecked \v -> case v of
            Just true -> setter (Just 0)
            _ -> setter Nothing
        }
    , case val of
        Nothing -> R.text ""
        Just n -> inputImpl
          { type: "number"
          , value: show n
          , step: "1"
          , className: inputClass
          , onChange: handler targetValue \v -> case v of
              Just str -> do
                let num = parseInt_ str
                when (num == num) (setter (Just num))
              Nothing -> pure unit
          }
    ]

instance RenderControl (Maybe Boolean) (Maybe Boolean) where
  renderControl _ lbl val setter = controlRow lbl
    [ inputImpl
        { type: "checkbox"
        , checked: isJust val
        , className: "accent-indigo-500 mr-2"
        , onChange: handler targetChecked \v -> case v of
            Just true -> setter (Just false)
            _ -> setter Nothing
        }
    , case val of
        Nothing -> R.text ""
        Just b -> inputImpl
          { type: "checkbox"
          , checked: b
          , className: "accent-indigo-500"
          , onChange: handler targetChecked \v -> case v of
              Just checked -> setter (Just checked)
              Nothing -> pure unit
          }
    ]

-- RenderControls: render controls for a whole record given schema, values, and a setter

class RenderControls :: RowList Type -> Row Type -> Row Type -> Constraint
class RenderControls rl schemaRow valuesRow | rl -> schemaRow valuesRow where
  renderControls
    :: forall g
     . g rl
    -> Record schemaRow
    -> Record valuesRow
    -> (Record valuesRow -> Effect Unit)
    -> Array JSX

instance RenderControls Nil schemaRow valuesRow where
  renderControls _ _ _ _ = []

instance
  ( IsSymbol name
  , RenderControl schemaType valueType
  , RenderControls tail schemaRow valuesRow
  , Row.Cons name schemaType whatever1 schemaRow
  , Row.Cons name valueType whatever2 valuesRow
  ) =>
  RenderControls (Cons name schemaType tail) schemaRow valuesRow where
  renderControls _ schema values setValues = [ thisControl ] <> restControls
    where
    nameP = Proxy :: Proxy name
    thisControl = renderControl (get nameP schema) (reflectSymbol nameP) (get nameP values) \newVal ->
      setValues (set nameP newVal values)
    restControls = renderControls (Proxy :: Proxy tail) schema values setValues

-- Generic string conversion for enums

class GenericToString :: Type -> Constraint
class GenericToString rep where
  genericToString :: rep -> String

instance (IsSymbol name) => GenericToString (Constructor name NoArguments) where
  genericToString _ = reflectSymbol (Proxy :: Proxy name)

instance (GenericToString a, GenericToString b) => GenericToString (Sum a b) where
  genericToString (Inl a) = genericToString a
  genericToString (Inr b) = genericToString b

class GenericFromString :: Type -> Constraint
class GenericFromString rep where
  genericFromString :: String -> Maybe rep

instance (IsSymbol name) => GenericFromString (Constructor name NoArguments) where
  genericFromString s
    | s == reflectSymbol (Proxy :: Proxy name) = Just (Constructor NoArguments)
    | otherwise = Nothing

instance (GenericFromString a, GenericFromString b) => GenericFromString (Sum a b) where
  genericFromString s = case genericFromString s of
    Just a -> Just (Inl a)
    Nothing -> case genericFromString s of
      Just b -> Just (Inr b)
      Nothing -> Nothing

-- Layout helpers

controlsPanel :: Array JSX -> JSX
controlsPanel controls =
  div { className: "border border-slate-700 rounded-lg bg-slate-800/50 p-4 space-y-3" }
    controls

controlRow :: String -> Array JSX -> JSX
controlRow lbl children =
  label { className: "flex items-center gap-3 text-sm" }
    [ R.span { className: "text-slate-400 w-24 shrink-0", children: [ R.text lbl ] }
    , R.div { className: "flex items-center flex-1", children }
    ]

inputClass :: String
inputClass = "w-full bg-slate-900 border border-slate-600 rounded px-2 py-1 text-sm text-slate-200 focus:border-indigo-500 focus:outline-none"

isJust :: forall a. Maybe a -> Boolean
isJust (Just _) = true
isJust Nothing = false

buildInitialValues
  :: forall schema rl to
   . RowToList schema rl
  => InitialValues rl schema () to
  => Record schema
  -> Record to
buildInitialValues schema = Builder.build (initialValues (Proxy :: Proxy rl) schema) {}
