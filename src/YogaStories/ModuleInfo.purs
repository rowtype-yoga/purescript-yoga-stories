module YogaStories.ModuleInfo where

import Prelude

import Data.Either (Either(..))
import Data.Maybe (Maybe(..))
import Data.Nullable (toNullable)
import Data.String (joinWith)
import Data.String as String
import Effect.Aff (Aff, attempt, throwError)
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
  let moduleName = joinWith "." corefn.moduleName
  componentSourceCode <- readComponentSource outputDir moduleName
  pure
    { moduleName
    , sourcePath: corefn.modulePath
    , exports: corefn.exports
    , sourceCode
    , componentSourceCode: toNullable componentSourceCode
    }

readComponentSource :: String -> String -> Aff (Maybe String)
readComponentSource outputDir moduleName = do
  case String.stripSuffix (String.Pattern ".Stories") moduleName of
    Nothing -> pure Nothing
    Just componentModule -> do
      result <- attempt do
        compCorefn <- readCoreFn outputDir componentModule
        readTextFile UTF8 compCorefn.modulePath
      case result of
        Right code -> pure (Just code)
        Left _ -> pure Nothing

readCoreFn :: String -> String -> Aff CoreFnJson
readCoreFn outputDir moduleDirName = do
  let path = concat [ outputDir, moduleDirName, "corefn.json" ]
  content <- readTextFile UTF8 path
  case readJSON content of
    Right corefn -> pure corefn
    Left errs -> throwError (error ("Failed to parse corefn.json for " <> moduleDirName <> ": " <> show errs))
