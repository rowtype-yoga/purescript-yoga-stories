module YogaStories.Types where

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
  }

type CoreFnJson =
  { moduleName :: Array String
  , modulePath :: String
  , exports :: Array String
  }
