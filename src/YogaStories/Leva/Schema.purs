module YogaStories.Leva.Schema
  ( class ToLevaSchema
  , toLevaSchema
  , class FromLevaValue
  , fromLevaValue
  , class WriteSchemaFields
  , writeSchemaFields
  , class SchemaToProps
  , class ReadProps
  , readProps
  , class GenericToString
  , genericToString
  , class GenericFromString
  , genericFromString
  , writeSchema
  ) where

import Prelude

import Data.Generic.Rep (class Generic, Constructor(..), NoArguments(..), Sum(Inl, Inr), from, to)
import Data.Maybe (Maybe(..), fromMaybe)
import Data.Newtype (un)
import Data.Nullable as Nullable
import Data.Symbol (class IsSymbol, reflectSymbol)
import Foreign (Foreign, unsafeFromForeign, unsafeToForeign)
import Prim.Row as Row
import Prim.RowList (class RowToList, Cons, Nil, RowList)
import Record (get)
import Record.Builder (Builder)
import Record.Builder as Builder
import Type.Proxy (Proxy(..))
import YogaStories.Leva.Controls (Color(..), Enum(..), Select(..), Slider(..))

class ToLevaSchema :: Type -> Type -> Constraint
class ToLevaSchema schema value | schema -> value where
  toLevaSchema :: schema -> Foreign

instance ToLevaSchema String String where
  toLevaSchema = unsafeToForeign

instance ToLevaSchema Number Number where
  toLevaSchema = unsafeToForeign

instance ToLevaSchema Int Int where
  toLevaSchema = unsafeToForeign

instance ToLevaSchema Boolean Boolean where
  toLevaSchema = unsafeToForeign

instance ToLevaSchema Slider Number where
  toLevaSchema = unsafeToForeign <<< un Slider

instance ToLevaSchema (Select String) String where
  toLevaSchema = unsafeToForeign <<< un Select

instance ToLevaSchema Color String where
  toLevaSchema (Color s) = unsafeToForeign s

instance ToLevaSchema (Maybe String) (Maybe String) where
  toLevaSchema = unsafeToForeign <<< Nullable.toNullable

instance ToLevaSchema (Maybe Number) (Maybe Number) where
  toLevaSchema = unsafeToForeign <<< Nullable.toNullable

instance ToLevaSchema (Maybe Int) (Maybe Int) where
  toLevaSchema = unsafeToForeign <<< Nullable.toNullable

instance ToLevaSchema (Maybe Boolean) (Maybe Boolean) where
  toLevaSchema = unsafeToForeign <<< Nullable.toNullable

instance (Generic a rep, GenericToString rep) => ToLevaSchema (Enum a) a where
  toLevaSchema (Enum e) = unsafeToForeign
    { value: genericToString (from e.value)
    , options: e.options
    }

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

class FromLevaValue :: Type -> Type -> Constraint
class FromLevaValue schemaType valueType | schemaType -> valueType where
  fromLevaValue :: Foreign -> valueType

instance FromLevaValue String String where
  fromLevaValue = unsafeFromForeign

instance FromLevaValue Number Number where
  fromLevaValue = unsafeFromForeign

instance FromLevaValue Int Int where
  fromLevaValue = unsafeFromForeign

instance FromLevaValue Boolean Boolean where
  fromLevaValue = unsafeFromForeign

instance FromLevaValue Slider Number where
  fromLevaValue = unsafeFromForeign

instance FromLevaValue (Select String) String where
  fromLevaValue = unsafeFromForeign

instance FromLevaValue Color String where
  fromLevaValue = unsafeFromForeign

instance FromLevaValue (Maybe String) (Maybe String) where
  fromLevaValue = Nullable.toMaybe <<< unsafeFromForeign

instance FromLevaValue (Maybe Number) (Maybe Number) where
  fromLevaValue = Nullable.toMaybe <<< unsafeFromForeign

instance FromLevaValue (Maybe Int) (Maybe Int) where
  fromLevaValue = Nullable.toMaybe <<< unsafeFromForeign

instance FromLevaValue (Maybe Boolean) (Maybe Boolean) where
  fromLevaValue = Nullable.toMaybe <<< unsafeFromForeign

instance (Generic a rep, GenericFromString rep) => FromLevaValue (Enum a) a where
  fromLevaValue foreignValue = do
    let str = unsafeFromForeign foreignValue :: String
    fromMaybe (unsafeFromForeign foreignValue) (to <$> genericFromString str)

class
  WriteSchemaFields (rl :: RowList Type) (row :: Row Type) (from :: Row Type) (to :: Row Type)
  | rl -> row from to where
  writeSchemaFields :: forall g. g rl -> Record row -> Builder (Record from) (Record to)

instance
  ( IsSymbol name
  , ToLevaSchema schemaType valueType
  , WriteSchemaFields tail row from from'
  , Row.Cons name schemaType whatever row
  , Row.Lacks name from'
  , Row.Cons name Foreign from' to
  ) =>
  WriteSchemaFields (Cons name schemaType tail) row from to where
  writeSchemaFields _ rec = Builder.insert nameP value <<< rest
    where
    nameP = Proxy :: Proxy name
    value = toLevaSchema (get nameP rec)
    rest = writeSchemaFields (Proxy :: Proxy tail) rec

instance WriteSchemaFields Nil row () () where
  writeSchemaFields _ _ = identity

class SchemaToProps (rl :: RowList Type) (propsRow :: Row Type) | rl -> propsRow

instance SchemaToProps Nil ()

instance
  ( ToLevaSchema schemaType valueType
  , SchemaToProps tail tailRow
  , Row.Cons name valueType tailRow propsRow
  , Row.Lacks name tailRow
  ) =>
  SchemaToProps (Cons name schemaType tail) propsRow

class
  ReadProps (rl :: RowList Type) (schemaRow :: Row Type) (from :: Row Type) (to :: Row Type)
  | rl -> schemaRow from to where
  readProps :: forall g. g rl -> Record schemaRow -> Foreign -> Builder (Record from) (Record to)

instance ReadProps Nil schemaRow () () where
  readProps _ _ _ = identity

instance
  ( IsSymbol name
  , FromLevaValue schemaType valueType
  , ReadProps tail schemaRow from from'
  , Row.Cons name schemaType whatever schemaRow
  , Row.Lacks name from'
  , Row.Cons name valueType from' to
  ) =>
  ReadProps (Cons name schemaType tail) schemaRow from to where
  readProps _ schemaRec foreignRec = Builder.insert nameP value <<< rest
    where
    nameP = Proxy :: Proxy name
    foreignProps = unsafeFromForeign foreignRec :: Record to
    value = fromLevaValue @schemaType (unsafeToForeign (get nameP foreignProps))
    rest = readProps (Proxy :: Proxy tail) schemaRec foreignRec

writeSchema
  :: forall row rl to
   . RowToList row rl
  => WriteSchemaFields rl row () to
  => Record row
  -> Foreign
writeSchema rec = unsafeToForeign (Builder.build steps {})
  where
  steps = writeSchemaFields (Proxy :: Proxy rl) rec
