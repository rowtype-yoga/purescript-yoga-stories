module YogaStories.Config where

import Prelude

import Data.Either (Either(..))
import Effect.Aff (Aff)
import Effect.Exception (error)
import Effect.Aff (throwError) as Aff
import Node.Encoding (Encoding(..))
import Node.FS.Aff (readTextFile)
import Yoga.JSON (readJSON)
import YogaStories.Types (Config)

defaultConfig :: Config
defaultConfig = do
  let outputDir = "./output"
  let include = [ "**" ]
  let exclude = []
  { outputDir, include, exclude }

readConfig :: String -> Aff Config
readConfig path = do
  content <- readTextFile UTF8 path
  case readJSON content of
    Right config -> pure config
    Left errs -> Aff.throwError (error ("Failed to parse config: " <> show errs))
