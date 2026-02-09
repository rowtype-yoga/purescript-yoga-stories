module YogaStories.Resolution where

import Prelude

import Data.Traversable (traverse)
import Effect.Aff (Aff)
import YogaStories.Config (readConfig)
import YogaStories.Discovery (filterModules, listOutputModules)
import YogaStories.ModuleInfo (readModuleInfo)
import YogaStories.Types (Config, StoryModule)

discoverStories :: Config -> Aff (Array StoryModule)
discoverStories config = do
  allModules <- listOutputModules config.outputDir
  let matched = filterModules config allModules
  traverse (readModuleInfo config.outputDir) matched

discoverStoriesFromFile :: String -> Aff (Array StoryModule)
discoverStoriesFromFile configPath = do
  config <- readConfig configPath
  discoverStories config
