module Test.Main where

import Prelude

import Effect (Effect)
import Effect.Aff (launchAff_)
import Test.Spec.Reporter (consoleReporter)
import Test.Spec.Runner (runSpec)
import Test.Discovery as Discovery
import Test.YogaStories.Leva.Schema as LevaSchema

main :: Effect Unit
main = launchAff_ $ runSpec [ consoleReporter ] do
  Discovery.spec
  LevaSchema.spec
