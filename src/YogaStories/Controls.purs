module YogaStories.Controls
  ( class InitialValue
  , initialValue
  , class RenderControl
  , renderControl
  , class InitialValues
  , initialValues
  , class RenderControls
  , renderControls
  , class ToParam
  , toParam
  , class FromParam
  , fromParam
  , class ToParams
  , toParams
  , class FromParams
  , fromParams
  , buildInitialValues
  , valuesToParams
  , paramsToValues
  , controlsPanel
  , class GenericToString
  , genericToString
  , class GenericFromString
  , genericFromString
  , module YogaStories.Controls.Types
  ) where

import Prelude

import Data.Generic.Rep (class Generic, Constructor(..), NoArguments(..), Sum(Inl, Inr), from, to)
import Foreign.Object (Object)
import Foreign.Object as Object
import Data.Maybe (Maybe(..))
import Data.Symbol (class IsSymbol, reflectSymbol)
import Effect (Effect)
import Prim.Row as Row
import Prim.RowList (class RowToList, Cons, Nil, RowList)
import React.Basic (JSX)
import React.Basic.DOM (text) as R
import React.Basic.DOM.Events (targetChecked, targetValue)
import React.Basic.Events (handler)
import Record (get, set)
import Record.Builder (Builder)
import Record.Builder as Builder
import Type.Proxy (Proxy(..))
import Yoga.JSON (readJSON_, writeJSON)
import YogaStories.Controls.Types (class EnumOptions, class GenericEnumOptions, Color(..), CustomControl(..), Enum(..), Select(..), Slider(..), color, customControl, enum, enumOptions, genericEnumOptions, select, slider)

-- FFI
foreign import inputImpl :: forall r. Record r -> JSX
foreign import elImpl :: forall r. String -> Record r -> Array JSX -> JSX
foreign import parseFloat_ :: String -> Number
foreign import parseInt_ :: String -> Int

-- Inline-styled elements (no CSS classes leak into user components)

el :: forall r. String -> Record r -> Array JSX -> JSX
el = elImpl

txt :: String -> JSX
txt = R.text

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

instance InitialValue (CustomControl value) value where
  initialValue (CustomControl c) = c.value

instance InitialValue (Maybe String) (Maybe String) where
  initialValue = identity

instance InitialValue (Maybe Number) (Maybe Number) where
  initialValue = identity

instance InitialValue (Maybe Int) (Maybe Int) where
  initialValue = identity

instance InitialValue (Maybe Boolean) (Maybe Boolean) where
  initialValue = identity

instance
  ( RowToList schema rl
  , InitialValues rl schema () values
  ) =>
  InitialValue (Record schema) (Record values) where
  initialValue schema = buildInitialValues schema

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
        , style: inputStyle
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
        , style: inputStyle
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
        , style: inputStyle
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
        , style: { accentColor: "#6366f1" }
        , onChange: handler targetChecked \v -> case v of
            Just b -> setter b
            Nothing -> pure unit
        }
    ]

instance RenderControl Slider Number where
  renderControl (Slider s) lbl val setter = controlRow lbl
    [ el "div" { style: { display: "flex", alignItems: "center", gap: "8px", flex: "1" } }
        [ inputImpl
            { type: "range"
            , min: show s.min
            , max: show s.max
            , step: show s.step
            , value: show val
            , style: { flex: "1", accentColor: "#6366f1" }
            , onChange: handler targetValue \v -> case v of
                Just str -> do
                  let n = parseFloat_ str
                  when (n == n) (setter n)
                Nothing -> pure unit
            }
        , el "span" { style: { fontSize: "11px", color: "#94a3b8", width: "48px", textAlign: "right" } } [ txt (show val) ]
        ]
    ]

instance RenderControl (Select String) String where
  renderControl (Select s) lbl val setter = controlRow lbl
    [ el "select"
        { value: val
        , style: selectStyle
        , onChange: handler targetValue \v -> case v of
            Just str -> setter str
            Nothing -> pure unit
        }
        (map (\opt -> el "option" { value: opt } [ txt opt ]) s.options)
    ]

instance RenderControl Color String where
  renderControl _ lbl val setter = controlRow lbl
    [ inputImpl
        { type: "color"
        , value: val
        , style: { width: "32px", height: "32px", borderRadius: "4px", border: "1px solid #475569", background: "transparent", cursor: "pointer", padding: "0" }
        , onChange: handler targetValue \v -> case v of
            Just s -> setter s
            Nothing -> pure unit
        }
    , el "span" { style: { fontSize: "11px", color: "#94a3b8", marginLeft: "8px" } } [ txt val ]
    ]

instance (Generic a rep, GenericToString rep, GenericFromString rep, EnumOptions a) => RenderControl (Enum a) a where
  renderControl _ lbl val setter = controlRow lbl
    [ el "select"
        { value: genericToString (from val)
        , style: selectStyle
        , onChange: handler targetValue \v -> case v of
            Just str -> case to <$> genericFromString str of
              Just a -> setter a
              Nothing -> pure unit
            Nothing -> pure unit
        }
        (map (\opt -> el "option" { value: opt } [ txt opt ]) (enumOptions (Proxy :: Proxy a)))
    ]

instance RenderControl (CustomControl value) value where
  renderControl (CustomControl c) lbl val setter = controlRow lbl
    [ c.render val setter ]

instance RenderControl (Maybe String) (Maybe String) where
  renderControl _ lbl val setter = controlRow lbl
    [ inputImpl
        { type: "checkbox"
        , checked: isJust val
        , style: { accentColor: "#6366f1", marginRight: "8px" }
        , onChange: handler targetChecked \v -> case v of
            Just true -> setter (Just "")
            _ -> setter Nothing
        }
    , case val of
        Nothing -> txt ""
        Just s -> inputImpl
          { type: "text"
          , value: s
          , style: inputStyle
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
        , style: { accentColor: "#6366f1", marginRight: "8px" }
        , onChange: handler targetChecked \v -> case v of
            Just true -> setter (Just 0.0)
            _ -> setter Nothing
        }
    , case val of
        Nothing -> txt ""
        Just n -> inputImpl
          { type: "number"
          , value: show n
          , step: "any"
          , style: inputStyle
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
        , style: { accentColor: "#6366f1", marginRight: "8px" }
        , onChange: handler targetChecked \v -> case v of
            Just true -> setter (Just 0)
            _ -> setter Nothing
        }
    , case val of
        Nothing -> txt ""
        Just n -> inputImpl
          { type: "number"
          , value: show n
          , step: "1"
          , style: inputStyle
          , onChange: handler targetValue \v -> case v of
              Just str -> do
                let num = parseInt_ str
                when (num == num) (setter (Just num))
              Nothing -> pure unit
          }
    ]

instance
  ( RowToList schema rl
  , RenderControls rl schema values
  ) =>
  RenderControl (Record schema) (Record values) where
  renderControl schema lbl values setter = controlGroup lbl
    (renderControls (Proxy :: Proxy rl) schema values setter)

instance RenderControl (Maybe Boolean) (Maybe Boolean) where
  renderControl _ lbl val setter = controlRow lbl
    [ inputImpl
        { type: "checkbox"
        , checked: isJust val
        , style: { accentColor: "#6366f1", marginRight: "8px" }
        , onChange: handler targetChecked \v -> case v of
            Just true -> setter (Just false)
            _ -> setter Nothing
        }
    , case val of
        Nothing -> txt ""
        Just b -> inputImpl
          { type: "checkbox"
          , checked: b
          , style: { accentColor: "#6366f1" }
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

-- ToParam / FromParam: convert values to/from strings for URL serialization

class ToParam :: Type -> Type -> Constraint
class ToParam schema value | schema -> value where
  toParam :: schema -> value -> String

instance ToParam String String where
  toParam _ = identity

instance ToParam Number Number where
  toParam _ = show

instance ToParam Int Int where
  toParam _ = show

instance ToParam Boolean Boolean where
  toParam _ b = if b then "true" else "false"

instance ToParam Slider Number where
  toParam _ = show

instance ToParam (Select String) String where
  toParam _ = identity

instance ToParam Color String where
  toParam _ = identity

instance (Generic a rep, GenericToString rep) => ToParam (Enum a) a where
  toParam _ = genericToString <<< from

instance ToParam (CustomControl value) value where
  toParam (CustomControl c) = c.toStr

instance ToParam (Maybe String) (Maybe String) where
  toParam _ Nothing = ""
  toParam _ (Just s) = s

instance ToParam (Maybe Number) (Maybe Number) where
  toParam _ Nothing = ""
  toParam _ (Just n) = show n

instance ToParam (Maybe Int) (Maybe Int) where
  toParam _ Nothing = ""
  toParam _ (Just n) = show n

instance ToParam (Maybe Boolean) (Maybe Boolean) where
  toParam _ Nothing = ""
  toParam _ (Just b) = if b then "true" else "false"

instance
  ( RowToList schema rl
  , InitialValues rl schema () values
  , ToParams rl schema values
  ) =>
  ToParam (Record schema) (Record values) where
  toParam schema values = writeJSON (toParams (Proxy :: Proxy rl) schema values)

class FromParam :: Type -> Type -> Constraint
class FromParam schema value | schema -> value where
  fromParam :: schema -> String -> Maybe value

instance FromParam String String where
  fromParam _ = Just

instance FromParam Number Number where
  fromParam _ s = do
    let n = parseFloat_ s
    if n == n then Just n else Nothing

instance FromParam Int Int where
  fromParam _ s = do
    let n = parseInt_ s
    if n == n then Just n else Nothing

instance FromParam Boolean Boolean where
  fromParam _ "true" = Just true
  fromParam _ "false" = Just false
  fromParam _ _ = Nothing

instance FromParam Slider Number where
  fromParam _ s = do
    let n = parseFloat_ s
    if n == n then Just n else Nothing

instance FromParam (Select String) String where
  fromParam _ = Just

instance FromParam Color String where
  fromParam _ = Just

instance (Generic a rep, GenericFromString rep) => FromParam (Enum a) a where
  fromParam _ s = to <$> genericFromString s

instance FromParam (CustomControl value) value where
  fromParam (CustomControl c) = c.fromStr

instance FromParam (Maybe String) (Maybe String) where
  fromParam _ "" = Just Nothing
  fromParam _ s = Just (Just s)

instance FromParam (Maybe Number) (Maybe Number) where
  fromParam _ "" = Just Nothing
  fromParam _ s = do
    let n = parseFloat_ s
    if n == n then Just (Just n) else Nothing

instance FromParam (Maybe Int) (Maybe Int) where
  fromParam _ "" = Just Nothing
  fromParam _ s = do
    let n = parseInt_ s
    if n == n then Just (Just n) else Nothing

instance FromParam (Maybe Boolean) (Maybe Boolean) where
  fromParam _ "" = Just Nothing
  fromParam _ "true" = Just (Just true)
  fromParam _ "false" = Just (Just false)
  fromParam _ _ = Nothing

instance
  ( RowToList schema rl
  , InitialValues rl schema () values
  , FromParams rl schema values
  ) =>
  FromParam (Record schema) (Record values) where
  fromParam schema s = do
    obj <- readJSON_ s
    let defaults = buildInitialValues schema
    Just (fromParams (Proxy :: Proxy rl) schema obj defaults)

-- ToParams / FromParams: walk a record via RowList

class ToParams :: RowList Type -> Row Type -> Row Type -> Constraint
class ToParams rl schemaRow valuesRow | rl -> schemaRow valuesRow where
  toParams :: forall g. g rl -> Record schemaRow -> Record valuesRow -> Object String

instance ToParams Nil schemaRow valuesRow where
  toParams _ _ _ = Object.empty

instance
  ( IsSymbol name
  , ToParam schemaType valueType
  , ToParams tail schemaRow valuesRow
  , Row.Cons name schemaType whatever1 schemaRow
  , Row.Cons name valueType whatever2 valuesRow
  ) =>
  ToParams (Cons name schemaType tail) schemaRow valuesRow where
  toParams _ schema values = Object.insert key val rest
    where
    nameP = Proxy :: Proxy name
    key = reflectSymbol nameP
    val = toParam (get nameP schema) (get nameP values)
    rest = toParams (Proxy :: Proxy tail) schema values

class FromParams :: RowList Type -> Row Type -> Row Type -> Constraint
class FromParams rl schemaRow valuesRow | rl -> schemaRow valuesRow where
  fromParams :: forall g. g rl -> Record schemaRow -> Object String -> Record valuesRow -> Record valuesRow

instance FromParams Nil schemaRow valuesRow where
  fromParams _ _ _ vals = vals

instance
  ( IsSymbol name
  , FromParam schemaType valueType
  , FromParams tail schemaRow valuesRow
  , Row.Cons name schemaType whatever1 schemaRow
  , Row.Cons name valueType whatever2 valuesRow
  ) =>
  FromParams (Cons name schemaType tail) schemaRow valuesRow where
  fromParams _ schema params values = do
    let rest = fromParams (Proxy :: Proxy tail) schema params values
    let nameP = Proxy :: Proxy name
    let key = reflectSymbol nameP
    case Object.lookup key params >>= fromParam (get nameP schema) of
      Just v -> set nameP v rest
      Nothing -> rest

valuesToParams
  :: forall schema rl to
   . RowToList schema rl
  => ToParams rl schema to
  => Record schema
  -> Record to
  -> Object String
valuesToParams schema values = toParams (Proxy :: Proxy rl) schema values

paramsToValues
  :: forall schema rl to
   . RowToList schema rl
  => FromParams rl schema to
  => Record schema
  -> Object String
  -> Record to
  -> Record to
paramsToValues schema params defaults = fromParams (Proxy :: Proxy rl) schema params defaults

-- Layout helpers (all inline styles, no CSS classes)

controlsPanel :: Array JSX -> JSX
controlsPanel controls =
  el "div"
    { style:
        { border: "1px solid #334155"
        , borderRadius: "8px"
        , background: "#1e293b"
        , padding: "16px"
        , display: "flex"
        , flexDirection: "column"
        , gap: "12px"
        , fontFamily: "-apple-system, BlinkMacSystemFont, 'Segoe UI', Roboto, sans-serif"
        , fontSize: "13px"
        , color: "#e2e8f0"
        , boxSizing: "border-box"
        }
    }
    controls

controlRow :: String -> Array JSX -> JSX
controlRow lbl children =
  el "label"
    { style: { display: "flex", alignItems: "center", gap: "12px" } }
    [ el "span" { style: { color: "#94a3b8", width: "96px", flexShrink: "0" } } [ txt lbl ]
    , el "div" { style: { display: "flex", alignItems: "center", flex: "1" } } children
    ]

controlGroup :: String -> Array JSX -> JSX
controlGroup lbl children =
  el "div"
    { style: { display: "flex", flexDirection: "column", gap: "8px" } }
    [ el "span" { style: { fontSize: "11px", fontWeight: "500", color: "#64748b", textTransform: "uppercase", letterSpacing: "0.05em" } } [ txt lbl ]
    , el "div" { style: { paddingLeft: "16px", borderLeft: "1px solid #334155", display: "flex", flexDirection: "column", gap: "12px" } } children
    ]

inputStyle :: { width :: String, background :: String, border :: String, borderRadius :: String, padding :: String, fontSize :: String, color :: String, outline :: String, boxSizing :: String }
inputStyle =
  { width: "100%"
  , background: "#0f172a"
  , border: "1px solid #475569"
  , borderRadius: "4px"
  , padding: "4px 8px"
  , fontSize: "13px"
  , color: "#e2e8f0"
  , outline: "none"
  , boxSizing: "border-box"
  }

selectStyle :: { width :: String, background :: String, border :: String, borderRadius :: String, padding :: String, fontSize :: String, color :: String, outline :: String, boxSizing :: String }
selectStyle = inputStyle { padding = "6px 32px 6px 8px" }

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
