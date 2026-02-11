module YogaStories.Types where

import Data.Nullable (Nullable)

type Config =
  { outputDir :: String
  , include :: Array String
  , exclude :: Array String
  }

type StoryModule =
  { moduleName :: String
  , sourcePath :: String
  , exports :: Array String
  , sourceCode :: String
  , componentSourceCode :: Nullable String
  }

type CoreFnJson =
  { moduleName :: Array String
  , modulePath :: String
  , exports :: Array String
  }
