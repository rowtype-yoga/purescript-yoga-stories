module Test.YogaStories.Controls where

import Prelude

import Data.Generic.Rep (class Generic)
import Data.Maybe (Maybe(..))
import Test.Spec (Spec, describe, it)
import Test.Spec.Assertions (shouldEqual)
import YogaStories.Controls (buildInitialValues, initialValue, slider, select, color, enum)

data Variant = A | B | C

derive instance Generic Variant _
derive instance Eq Variant
instance Show Variant where
  show A = "A"
  show B = "B"
  show C = "C"

spec :: Spec Unit
spec = describe "Controls" do
  describe "initialValue" do
    it "extracts String identity" do
      initialValue "hello" `shouldEqual` "hello"

    it "extracts Number identity" do
      initialValue 42.0 `shouldEqual` 42.0

    it "extracts Boolean identity" do
      initialValue true `shouldEqual` true

    it "extracts Slider value" do
      initialValue (slider { value: 0.5, min: 0.0, max: 1.0, step: 0.1 }) `shouldEqual` 0.5

    it "extracts Select value" do
      initialValue (select "a" [ "a", "b" ]) `shouldEqual` "a"

    it "extracts Color value" do
      initialValue (color "#ff0000") `shouldEqual` "#ff0000"

    it "extracts Enum value" do
      initialValue (enum A) `shouldEqual` A

    it "extracts Maybe String identity" do
      initialValue (Just "x" :: Maybe String) `shouldEqual` Just "x"

    it "extracts Nothing identity" do
      initialValue (Nothing :: Maybe String) `shouldEqual` Nothing

  describe "buildInitialValues" do
    it "builds a record of initial values from a schema" do
      let schema = { label: "hello", value: slider { value: 0.5, min: 0.0, max: 1.0, step: 0.1 } }
      let values = buildInitialValues schema
      values.label `shouldEqual` "hello"
      values.value `shouldEqual` 0.5

    it "handles Maybe fields" do
      let schema = { name: Just "world" :: Maybe String, count: 10 }
      let values = buildInitialValues schema
      values.name `shouldEqual` Just "world"
      values.count `shouldEqual` 10

    it "handles nested records" do
      let schema = { outer: "top", nested: { inner: "hello", num: 42.0 } }
      let values = buildInitialValues schema
      values.outer `shouldEqual` "top"
      values.nested.inner `shouldEqual` "hello"
      values.nested.num `shouldEqual` 42.0

    it "handles deeply nested records" do
      let schema = { a: { b: { c: "deep" } } }
      let values = buildInitialValues schema
      values.a.b.c `shouldEqual` "deep"

    it "handles nested records with controls" do
      let schema = { group: { val: slider { value: 0.5, min: 0.0, max: 1.0, step: 0.1 }, name: "test" } }
      let values = buildInitialValues schema
      values.group.val `shouldEqual` 0.5
      values.group.name `shouldEqual` "test"
