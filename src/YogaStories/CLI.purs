module YogaStories.CLI where

import Prelude

import Data.Maybe (Maybe(..))
import Data.Nullable (Nullable, toNullable)
import Effect (Effect)
import Options.Applicative (Parser, ParserInfo, command, execParser, fullDesc, header, help, helper, hsubparser, info, int, long, metavar, option, progDesc, short, showDefault, strOption, switch, value, (<**>))

data Command
  = Serve ServeOpts
  | Build BuildOpts

type ServeOpts =
  { port :: Int
  , configPath :: String
  , outputDir :: Maybe String
  , open :: Boolean
  }

type BuildOpts =
  { configPath :: String
  , outputDir :: Maybe String
  , outDir :: String
  , skipOptimize :: Boolean
  }

-- FFI
foreign import startDevServerImpl
  :: { port :: Int, configPath :: String, outputDir :: Nullable String, open :: Boolean }
  -> Effect Unit

foreign import buildProductionImpl
  :: { configPath :: String, outputDir :: Nullable String, outDir :: String, skipOptimize :: Boolean }
  -> Effect Unit

-- CLI entry point
main :: Effect Unit
main = do
  cmd <- execParser cliParser
  case cmd of
    Serve opts -> startDevServerImpl opts { outputDir = toNullable opts.outputDir }
    Build opts -> buildProductionImpl opts { outputDir = toNullable opts.outputDir }

-- Parsers
cliParser :: ParserInfo Command
cliParser = info (commandParser <**> helper)
  ( fullDesc
      <> header "yoga-stories - PureScript component storybook"
  )

commandParser :: Parser Command
commandParser = hsubparser
  ( command "serve" (info (Serve <$> serveParser) (progDesc "Start the dev server"))
      <> command "build" (info (Build <$> buildParser) (progDesc "Production build with purs-backend-es"))
  )

serveParser :: Parser ServeOpts
serveParser = ado
  port <- option int
    ( long "port"
        <> short 'p'
        <> metavar "PORT"
        <> help "Dev server port"
        <> value 6006
        <> showDefault
    )
  configPath <- strOption
    ( long "config"
        <> short 'c'
        <> metavar "PATH"
        <> help "Config file path"
        <> value "yoga-stories.json"
        <> showDefault
    )
  outputDir <- outputDirOption
  noOpen <- switch
    ( long "no-open"
        <> help "Do not open browser on start"
    )
  in { port, configPath, outputDir, open: not noOpen }

buildParser :: Parser BuildOpts
buildParser = ado
  configPath <- strOption
    ( long "config"
        <> short 'c'
        <> metavar "PATH"
        <> help "Config file path"
        <> value "yoga-stories.json"
        <> showDefault
    )
  outputDir <- outputDirOption
  outDir <- strOption
    ( long "out-dir"
        <> metavar "DIR"
        <> help "Build output directory"
        <> value "dist"
        <> showDefault
    )
  skipOptimize <- switch
    ( long "skip-optimize"
        <> help "Skip purs-backend-es step"
    )
  in { configPath, outputDir, outDir, skipOptimize }

outputDirOption :: Parser (Maybe String)
outputDirOption = ado
  dir <- strOption
    ( long "output"
        <> short 'o'
        <> metavar "DIR"
        <> help "PureScript output directory"
        <> value ""
    )
  in if dir == "" then Nothing else Just dir
