module YogaStories.UI.Hash
  ( Selection
  , parseHash
  , toHash
  , useHashRoute
  ) where

import Prelude

import Data.Maybe (Maybe(..))
import Data.String (Pattern(..), split, drop, take)
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

parseHash :: String -> Selection
parseHash h = do
  let stripped = stripPrefix h
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
    setSel (parseHash h)
    listener <- eventListener \_ -> do
      h' <- Location.hash loc
      setSel (parseHash h')
    let target = Window.toEventTarget w
    addEventListener (EventType "hashchange") listener false target
    pure (removeEventListener (EventType "hashchange") listener false target)

  let
    onSelect modName expName = do
      let next = { moduleName: Just modName, exportName: Just expName }
      w <- window
      loc <- Window.location w
      Location.setHash (toHash next) loc
  pure (sel /\ onSelect)
