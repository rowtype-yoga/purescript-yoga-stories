module Main where

import Prelude

import Data.Array (length)
import Effect (Effect)
import Effect.Aff (launchAff_, never)
import Effect.Class.Console as Console
import Node.Encoding (Encoding(..))
import Node.FS.Aff (mkdir', writeTextFile)
import Node.FS.Perms (permsAll)
import YogaStories.Resolution (discoverStories)
import YogaStories.Server (startServer)
import YogaStories.UI.App (renderHtml)

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
  writeTextFile UTF8 "./dist/index.html" (renderHtml stories)
  Console.log "Wrote dist/index.html"
  startServer "./dist" 9010
  never
