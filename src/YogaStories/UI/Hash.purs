module YogaStories.UI.Hash
  ( Selection
  , parseHash
  , toHash
  , useHashRoute
  , readHashProps
  , writeHashProps
  ) where

import Prelude

import Data.Array as Array
import Data.Maybe (Maybe(..), maybe)
import Data.String (Pattern(..), split, drop, take, indexOf)
import Data.Tuple.Nested (type (/\), (/\))
import Effect (Effect)
import React.Basic.Hooks as React
import React.Basic.Hooks (Render, UseEffect, UseState)
import Web.Event.Event (EventType(..))
import Web.Event.EventTarget (addEventListener, eventListener, removeEventListener)
import Web.HTML (window)
import Web.HTML.Location as Location
import Web.HTML.Window as Window

type Selection = { moduleName :: Maybe String, exportName :: Maybe String }

noSelection :: Selection
noSelection = { moduleName: Nothing, exportName: Nothing }

-- Strip the ?... query portion from a hash string
hashPath :: String -> String
hashPath h = case indexOf (Pattern "?") h of
  Just i -> take i h
  Nothing -> h

-- Extract the raw query string after ? in the hash (without the ?)
hashQuery :: String -> Maybe String
hashQuery h = case indexOf (Pattern "?") h of
  Just i -> do
    let q = drop (i + 1) h
    if q == "" then Nothing else Just q
  Nothing -> Nothing

parseHash :: String -> Selection
parseHash h = do
  let stripped = stripPrefix (hashPath h)
  case split (Pattern "/") stripped of
    [ m, e ] | m /= "" -> { moduleName: Just m, exportName: Just e }
    [ m ] | m /= "" -> { moduleName: Just m, exportName: Nothing }
    _ -> noSelection
  where
  stripPrefix s
    | take 2 s == "#/" = drop 2 s
    | take 1 s == "#" = drop 1 s
    | otherwise = s

toHash :: Selection -> String
toHash { moduleName: Just m, exportName: Just e } = "#/" <> m <> "/" <> e
toHash { moduleName: Just m } = "#/" <> m
toHash _ = "#"

useHashRoute
  :: forall hooks
   . Render hooks
       (UseEffect Unit (UseState Selection hooks))
       (Selection /\ (String -> String -> Effect Unit))
useHashRoute = React.do
  sel /\ setSel <- React.useState' noSelection

  React.useEffectOnce do
    w <- window
    loc <- Window.location w
    h <- Location.hash loc
    let parsed = parseHash h
    let isNoSelection = parsed.moduleName == Nothing && parsed.exportName == Nothing
    let defaultSel = if isNoSelection then { moduleName: Just "Examples.Button.Stories", exportName: Just "story" } else parsed
    setSel defaultSel
    listener <- eventListener \_ -> do
      h' <- Location.hash loc
      setSel (parseHash h')
    let target = Window.toEventTarget w
    addEventListener (EventType "hashchange") listener false target
    pure (removeEventListener (EventType "hashchange") listener false target)

  let
    onSelect modName expName = do
      w <- window
      loc <- Window.location w
      h <- Location.hash loc
      let query = hashQuery h
      let base = toHash { moduleName: Just modName, exportName: Just expName }
      let full = base <> maybe "" ("?" <> _) query
      Location.setHash full loc
  pure (sel /\ onSelect)

readHashProps :: Effect (Maybe String)
readHashProps = do
  w <- window
  loc <- Window.location w
  h <- Location.hash loc
  pure (extractProps h)

writeHashProps :: String -> Effect Unit
writeHashProps json = do
  w <- window
  loc <- Window.location w
  h <- Location.hash loc
  let base = hashPath h
  Location.setHash (base <> "?props=" <> encodeURIComponent json) loc

-- Extract the props= value from a hash query string, URL-decoded
extractProps :: String -> Maybe String
extractProps h = do
  q <- hashQuery h
  let pairs = split (Pattern "&") q
  findProps pairs
  where
  findProps = Array.findMap \p ->
    if take 6 p == "props=" then Just (decodeURIComponent (drop 6 p))
    else Nothing

foreign import encodeURIComponent :: String -> String
foreign import decodeURIComponent :: String -> String
