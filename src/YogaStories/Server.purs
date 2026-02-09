module YogaStories.Server where

import Prelude

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

startServer :: String -> Int -> Aff Unit
startServer distDir port = do
  app <- liftEffect do
    f <- F.fastify {}
    F.get (F.RouteURL "/*") (staticHandler distDir) f
    pure f
  address <- F.listen { port: F.Port port } app
  Console.log ("yoga-stories running at " <> address)
  where
  staticHandler dir req reply = do
    reqUrl <- liftEffect $ F.url req
    let path = un F.RouteURL reqUrl
    let filePath = dir <> if path == "/" then "/index.html" else path
    let contentType = mimeType path
    result <- attempt (readTextFile UTF8 filePath)
    case result of
      Right content -> do
        liftEffect $ void $ F.header "Content-Type" contentType reply
        F.send (unsafeToForeign content) reply
      Left _ -> do
        liftEffect $ void $ F.status (F.StatusCode 404) reply
        F.send (unsafeToForeign "Not found") reply

  mimeType path
    | String.contains (String.Pattern ".html") path = "text/html; charset=utf-8"
    | String.contains (String.Pattern ".js.map") path = "application/json"
    | String.contains (String.Pattern ".js") path = "application/javascript"
    | String.contains (String.Pattern ".css") path = "text/css"
    | otherwise = "application/octet-stream"
