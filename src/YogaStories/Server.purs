module YogaStories.Server where

import Prelude

import Data.Array (length)
import Effect.Aff (Aff)
import Effect.Class (liftEffect)
import Effect.Class.Console as Console
import Foreign (unsafeToForeign)
import Yoga.Fastify.Fastify as F
import Yoga.JSON (writeJSON)
import YogaStories.Resolution (discoverStories)
import YogaStories.Types (Config)
import YogaStories.UI.App (renderApp)

startServer :: Config -> Int -> Aff Unit
startServer config port = do
  stories <- discoverStories config
  Console.log ("Found " <> show (length stories) <> " stories")
  app <- liftEffect $ F.fastify {}
  liftEffect $ F.get (F.RouteURL "/api/stories") (storiesHandler stories) app
  liftEffect $ F.get (F.RouteURL "/") (indexHandler stories) app
  address <- F.listen { port: F.Port port } app
  Console.log ("yoga-stories running at " <> address)
  where
  storiesHandler stories _req reply = do
    let json = writeJSON stories
    liftEffect do
      _ <- F.header "Content-Type" "application/json" reply
      pure unit
    F.send (unsafeToForeign json) reply

  indexHandler stories _req reply = do
    let html = renderApp stories
    liftEffect do
      _ <- F.header "Content-Type" "text/html; charset=utf-8" reply
      pure unit
    F.send (unsafeToForeign html) reply
