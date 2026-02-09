module YogaStories.Leva.Controls
  ( Slider(..)
  , slider
  , Select(..)
  , select
  , Color(..)
  , color
  , Enum(..)
  , enum
  , class EnumOptions
  , enumOptions
  , class GenericEnumOptions
  , genericEnumOptions
  ) where

import Prelude

import Data.Generic.Rep (class Generic, Constructor, NoArguments, Sum)
import Data.Newtype (class Newtype)
import Data.Symbol (class IsSymbol, reflectSymbol)
import Type.Proxy (Proxy(..))

newtype Slider = Slider { value :: Number, min :: Number, max :: Number, step :: Number }

derive instance Newtype Slider _

slider :: { value :: Number, min :: Number, max :: Number, step :: Number } -> Slider
slider = Slider

newtype Select a = Select { value :: a, options :: Array a }

derive instance Newtype (Select a) _

select :: forall a. a -> Array a -> Select a
select value options = Select { value, options }

newtype Color = Color String

derive instance Newtype Color _

color :: String -> Color
color = Color

newtype Enum a = Enum { value :: a, options :: Array String }

derive instance Newtype (Enum a) _

class EnumOptions :: Type -> Constraint
class EnumOptions a where
  enumOptions :: Proxy a -> Array String

class GenericEnumOptions :: Type -> Constraint
class GenericEnumOptions rep where
  genericEnumOptions :: Proxy rep -> Array String

instance GenericEnumOptions NoArguments where
  genericEnumOptions _ = []

instance (IsSymbol name) => GenericEnumOptions (Constructor name NoArguments) where
  genericEnumOptions _ = [ reflectSymbol (Proxy :: Proxy name) ]

instance (GenericEnumOptions a, GenericEnumOptions b) => GenericEnumOptions (Sum a b) where
  genericEnumOptions _ = genericEnumOptions (Proxy :: Proxy a) <> genericEnumOptions (Proxy :: Proxy b)

instance (Generic a rep, GenericEnumOptions rep) => EnumOptions a where
  enumOptions _ = genericEnumOptions (Proxy :: Proxy rep)

enum :: forall a. EnumOptions a => a -> Enum a
enum value = Enum { value, options: enumOptions (Proxy :: Proxy a) }
