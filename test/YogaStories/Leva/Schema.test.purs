module Test.YogaStories.Leva.Schema where

import Prelude

import Data.Maybe (Maybe(..))
import Data.Nullable as Nullable
import Foreign (unsafeFromForeign, unsafeToForeign)
import Test.Spec (Spec, describe, it)
import Test.Spec.Assertions (shouldEqual)
import YogaStories.Leva.Schema (fromLevaValue, toLevaSchema)

spec :: Spec Unit
spec = describe "Leva Schema Maybe support" do
  describe "toLevaSchema" do
    it "converts Maybe String to Nullable" do
      let result = toLevaSchema (Just "hello" :: Maybe String)
      let nullable = unsafeFromForeign result
      Nullable.toMaybe nullable `shouldEqual` Just "hello"

    it "converts Nothing to null" do
      let result = toLevaSchema (Nothing :: Maybe String)
      let nullable = unsafeFromForeign result
      (Nullable.toMaybe nullable :: Maybe String) `shouldEqual` Nothing

    it "converts Maybe Number to Nullable" do
      let result = toLevaSchema (Just 42.0 :: Maybe Number)
      let nullable = unsafeFromForeign result
      Nullable.toMaybe nullable `shouldEqual` Just 42.0

  describe "fromLevaValue" do
    it "converts Nullable to Maybe" do
      let foreignValue = unsafeToForeign (Nullable.notNull "world")
      let result = fromLevaValue @(Maybe String) foreignValue
      result `shouldEqual` Just "world"

    it "converts null to Nothing" do
      let foreignValue = unsafeToForeign Nullable.null
      let result = fromLevaValue @(Maybe String) foreignValue
      result `shouldEqual` Nothing

    it "converts Nullable Number to Maybe" do
      let foreignValue = unsafeToForeign (Nullable.notNull 3.14)
      let result = fromLevaValue @(Maybe Number) foreignValue
      result `shouldEqual` Just 3.14
