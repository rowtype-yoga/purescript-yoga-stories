module Main where

import Prelude

import Effect (Effect)
import Effect.Aff (launchAff_, never)
import YogaStories.Server (startServer)

main :: Effect Unit
main = launchAff_ do
  let
    config =
      { outputDir: "./output"
      , include: [ "YogaStories.**", "Main" ]
      , exclude: []
      }
  startServer config 9010
  never
