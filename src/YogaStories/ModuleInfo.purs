module YogaStories.ModuleInfo where

import Prelude

import Data.Either (Either(..))
import Data.String (joinWith)
import Effect.Aff (Aff, throwError)
import Effect.Exception (error)
import Node.Encoding (Encoding(..))
import Node.FS.Aff (readTextFile)
import Node.Path (concat)
import Yoga.JSON (readJSON)
import YogaStories.Types (CoreFnJson, StoryModule)

readModuleInfo :: String -> String -> Aff StoryModule
readModuleInfo outputDir moduleDirName = do
  corefn <- readCoreFn outputDir moduleDirName
  sourceCode <- readTextFile UTF8 corefn.modulePath
  pure
    { moduleName: joinWith "." corefn.moduleName
    , sourcePath: corefn.modulePath
    , exports: corefn.exports
    , sourceCode
    }

readCoreFn :: String -> String -> Aff CoreFnJson
readCoreFn outputDir moduleDirName = do
  let path = concat [ outputDir, moduleDirName, "corefn.json" ]
  content <- readTextFile UTF8 path
  case readJSON content of
    Right corefn -> pure corefn
    Left errs -> throwError (error ("Failed to parse corefn.json for " <> moduleDirName <> ": " <> show errs))
