module Main where

import Prelude

import Data.Array (length)
import Effect (Effect)
import Effect.Aff (launchAff_, never)
import Effect.Class.Console as Console
import Node.Encoding (Encoding(..))
import Node.FS.Aff (mkdir', readTextFile, writeTextFile)
import Node.FS.Perms (permsAll)
import Yoga.JSON (writeJSON)
import YogaStories.Resolution (discoverStories)
import YogaStories.Server (startServer)

main :: Effect Unit
main = launchAff_ do
  let
    config =
      { outputDir: "./output"
      , include: [ "**.Stories" ]
      , exclude: []
      }
  stories <- discoverStories config
  Console.log ("Discovered " <> show (length stories) <> " story modules")
  mkdir' "./dist" { recursive: true, mode: permsAll }
  indexHtml <- readTextFile UTF8 "./static/index.html"
  writeTextFile UTF8 "./dist/index.html" indexHtml
  writeTextFile UTF8 "./dist/stories.json" (writeJSON stories)
  Console.log "Wrote dist/index.html and dist/stories.json"
  startServer { distDir: "./dist" } 9010
  never
