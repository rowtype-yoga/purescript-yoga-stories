module YogaStories.Leva.Controls where

import Data.Newtype (class Newtype)

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
