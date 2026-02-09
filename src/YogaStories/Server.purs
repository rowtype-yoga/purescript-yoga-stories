module YogaStories.Server where

import Prelude

import Data.Array (length)
import Data.Either (Either(..))
import Data.Newtype (un)
import Data.String as String
import Effect.Aff (Aff, attempt)
import Effect.Class (liftEffect)
import Effect.Class.Console as Console
import Foreign (unsafeToForeign)
import Node.Encoding (Encoding(..))
import Node.FS.Aff (readTextFile)
import Yoga.Fastify.Fastify as F
import Yoga.JSON (writeJSON)
import YogaStories.Resolution (discoverStories)
import YogaStories.Types (Config)
import YogaStories.UI.App (renderShell)

startServer :: Config -> Int -> Aff Unit
startServer config port = do
  stories <- discoverStories config
  Console.log ("Found " <> show (length stories) <> " stories")
  app <- liftEffect do
    f <- F.fastify {}
    F.get (F.RouteURL "/api/stories") (storiesHandler stories) f
    F.get (F.RouteURL "/") (indexHandler stories) f
    F.get (F.RouteURL "/output/*") (staticHandler config.outputDir) f
    pure f
  address <- F.listen { port: F.Port port } app
  Console.log ("yoga-stories running at " <> address)
  where
  storiesHandler stories _req reply = do
    liftEffect $ void $ F.header "Content-Type" "application/json" reply
    F.send (unsafeToForeign (writeJSON stories)) reply

  indexHandler stories _req reply = do
    liftEffect $ void $ F.header "Content-Type" "text/html; charset=utf-8" reply
    F.send (unsafeToForeign (renderShell stories)) reply

  staticHandler outputDir req reply = do
    reqUrl <- liftEffect $ F.url req
    let path = un F.RouteURL reqUrl
    let filePath = outputDir <> String.drop (String.length "/output") path
    let
      contentType =
        if String.contains (String.Pattern ".js.map") path then "application/json"
        else if String.contains (String.Pattern ".js") path then "application/javascript"
        else "application/octet-stream"
    result <- attempt (readTextFile UTF8 filePath)
    case result of
      Right content -> do
        liftEffect $ void $ F.header "Content-Type" contentType reply
        F.send (unsafeToForeign content) reply
      Left _ -> do
        liftEffect $ void $ F.status (F.StatusCode 404) reply
        F.send (unsafeToForeign "Not found") reply
