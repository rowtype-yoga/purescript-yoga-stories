module YogaStories.Discovery where

import Prelude

import Data.Array as Array
import Data.Either (Either(..))
import Data.Maybe (Maybe(..))
import Data.String (Pattern(..))
import Data.String as String
import Effect.Aff (Aff, attempt)
import Node.FS.Aff (readdir, stat)
import Node.Path (concat)
import YogaStories.Types (Config)

listOutputModules :: String -> Aff (Array String)
listOutputModules outputDir = do
  entries <- readdir outputDir
  Array.filterA (isModuleDir outputDir) entries

isModuleDir :: String -> String -> Aff Boolean
isModuleDir outputDir entry = do
  let path = concat [ outputDir, entry, "index.js" ]
  result <- attempt (stat path)
  pure case result of
    Right _ -> true
    Left _ -> false

-- | Match a dot-separated module name against a dot-separated glob pattern.
-- | `*` matches exactly one segment, `**` matches zero or more segments.
matchModuleGlob :: String -> String -> Boolean
matchModuleGlob pattern moduleName =
  matchSegments patSegments modSegments
  where
  patSegments = String.split (Pattern ".") pattern
  modSegments = String.split (Pattern ".") moduleName

matchSegments :: Array String -> Array String -> Boolean
matchSegments pats mods = case Array.uncons pats, Array.uncons mods of
  Nothing, Nothing -> true
  Just { head: "**", tail }, Nothing ->
    matchSegments tail mods
  Just { head: "**" }, Just _ ->
    matchSegments (Array.drop 1 pats) mods
      || matchSegments pats (Array.drop 1 mods)
  Just { head: "*", tail: restPat }, Just { tail: restMod } ->
    matchSegments restPat restMod
  Just { head: p, tail: restPat }, Just { head: m, tail: restMod }
    | p == m -> matchSegments restPat restMod
  _, _ -> false

filterModules :: Config -> Array String -> Array String
filterModules config modules =
  Array.filter (not <<< matchesAny config.exclude) included
  where
  included = Array.filter (matchesAny config.include) modules
  matchesAny patterns name = Array.any (\p -> matchModuleGlob p name) patterns
