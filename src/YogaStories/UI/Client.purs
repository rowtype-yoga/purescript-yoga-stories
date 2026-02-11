module YogaStories.UI.Client where

import Prelude hiding (div)

import Data.Array as Array
import Data.Array (find)
import Data.Maybe (Maybe(..), fromMaybe)
import Data.Tuple.Nested ((/\))
import Effect (Effect)
import Effect.Aff (launchAff_)
import Effect.Class (liftEffect)
import Effect.Uncurried (EffectFn2, runEffectFn2)
import Foreign (Foreign)
import Promise (Promise)
import Promise.Aff (toAffE)
import Data.String as String
import React.Basic (JSX, element)
import React.Basic.DOM as R
import React.Basic.DOM.Client (createRoot, renderRoot)
import React.Basic.DOM.Events (targetValue)
import React.Basic.Events (handler, handler_)
import React.Basic.Hooks as React
import React.Basic.Hooks.Internal (unsafeRenderEffect)
import Web.DOM (Element)
import Yoga.React (component)
import Yoga.React.DOM.HTML (button, details, div, h3, nav, summary)
import Yoga.React.DOM.Internal (text)
import YogaStories.Types (StoryModule)
import YogaStories.UI.Hash (Selection, useHashRoute)
import YogaStories.UI.Styles as S

-- FFI
foreign import dynamicImportImpl :: String -> Effect (Promise Foreign)
foreign import fetchStoryDataImpl :: Effect (Promise (Array StoryModule))
foreign import unsafeGetPropertyImpl :: EffectFn2 String Foreign JSX
foreign import getElementByIdImpl :: String -> Effect Element
foreign import onModuleUpdateImpl :: (String -> Effect Unit) -> Effect Unit
foreign import onStoriesUpdateImpl :: Effect Unit -> Effect Unit
foreign import codeViewerComponent :: React.ReactComponent { code :: String }

unsafeGetProperty :: String -> Foreign -> Effect JSX
unsafeGetProperty = runEffectFn2 unsafeGetPropertyImpl

-- Entry point (called from browser)
clientMain :: Effect Unit
clientMain = launchAff_ do
  stories <- toAffE fetchStoryDataImpl
  liftEffect do
    el <- getElementByIdImpl "app"
    root <- createRoot el
    renderRoot root (app stories)

-- App
app :: Array StoryModule -> JSX
app = component "App" \initialStories -> React.do
  sel /\ onSelect <- useHashRoute
  stories /\ setStories <- React.useState' initialStories

  React.useEffectOnce do
    onStoriesUpdateImpl do
      launchAff_ do
        fresh <- toAffE fetchStoryDataImpl
        liftEffect $ setStories fresh
    pure mempty

  pure $
    div { style: S.root }
      [ div { style: S.row }
          [ sidebar { stories, selected: sel, onSelect }
          , mainPanel { selected: sel, stories }
          ]
      ]

-- Sidebar
sidebar :: { stories :: Array StoryModule, selected :: Selection, onSelect :: String -> String -> Effect Unit } -> JSX
sidebar = component "Sidebar" \props -> React.do
  query /\ setQuery <- React.useState' ""
  let needle = String.toLower query
  let
    filtered = props.stories # Array.filter \s ->
      String.contains (String.Pattern needle) (String.toLower s.moduleName)
        || Array.any (String.contains (String.Pattern needle) <<< String.toLower) s.exports
  pure $
    nav { style: S.sidebarNav }
      [ div { style: S.searchBox }
          [ R.input
              { type: "text"
              , placeholder: "Search..."
              , value: query
              , onChange: handler targetValue \v -> case v of
                  Just q -> setQuery q
                  _ -> pure unit
              , style: R.css
                  { width: "100%"
                  , padding: "6px 10px"
                  , fontSize: "13px"
                  , border: "1px solid #334155"
                  , borderRadius: "4px"
                  , background: "#1e293b"
                  , color: "#e2e8f0"
                  , outline: "none"
                  , fontFamily: "inherit"
                  }
              }
          ]
      , div { style: S.sidebarContent, className: "ys-sidebar-scroll" }
          [ div {} (map (moduleGroup props) filtered)
          ]
      , div { style: S.sidebarBranding } (text "yoga-stories")
      ]
  where
  moduleGroup props s = do
    let label = String.stripSuffix (String.Pattern ".Stories") s.moduleName # fromMaybe s.moduleName
    div {}
      [ div { style: S.moduleLabel } (text label)
      , div {} (map (exportBtn props s.moduleName) s.exports)
      ]

  exportBtn props modName expName = do
    let isSelected = props.selected.moduleName == Just modName && props.selected.exportName == Just expName
    button
      { style: S.exportButton isSelected
      , onClick: handler_ (props.onSelect modName expName)
      }
      (text expName)

-- Main panel
mainPanel :: { selected :: Selection, stories :: Array StoryModule } -> JSX
mainPanel = component "MainPanel" \props -> React.do
  loaded /\ setLoaded <- React.useState (Nothing :: Maybe { name :: String, mod :: Foreign })
  layoutRight /\ setLayoutRight <- React.useState' true
  stageDark /\ setStageDark <- React.useState' true
  hmrVersion /\ setHmrVersion <- React.useState 0

  React.useEffectOnce do
    onModuleUpdateImpl \_ ->
      setHmrVersion (_ + 1)
    pure mempty

  React.useEffect { mod: props.selected.moduleName, ver: hmrVersion } do
    case props.selected.moduleName of
      Nothing -> pure mempty
      Just modName -> do
        launchAff_ do
          mod <- toAffE (dynamicImportImpl ("/output/" <> modName <> "/index.js"))
          liftEffect $ setLoaded \_ -> Just { name: modName, mod }
        pure mempty

  let layoutClass = if layoutRight then "ys-layout-right" else "ys-layout-bottom"
  let stageClass = if stageDark then "ys-stage-dark" else "ys-stage-light"
  let toggleLabel = if layoutRight then "↓" else "→"
  let stageLabel = if stageDark then "☀" else "☾"

  pure case props.selected.moduleName, props.selected.exportName of
    Just modName, Just expName -> do
      let key = modName <> "." <> expName
      let info = find (\s -> s.moduleName == modName) props.stories
      case loaded of
        Nothing ->
          div { style: S.panel <> S.muted } (text "Loading...")
        Just l ->
          div { style: S.panel }
            [ div { style: S.storyHeader }
                [ h3 { style: S.storyTitle } (text key)
                , div { style: S.toolbarButtons }
                    [ button
                        { style: S.layoutToggle
                        , onClick: handler_ (setStageDark (not stageDark))
                        }
                        (text stageLabel)
                    , button
                        { style: S.layoutToggle
                        , onClick: handler_ (setLayoutRight (not layoutRight))
                        }
                        (text toggleLabel)
                    ]
                ]
            , storyView { mod: l.mod, exportName: expName, layoutClass, stageClass }
            , sourceView info
            ]
    _, _ ->
      div { style: S.panelPlaceholder } (text "Select a story")

-- Renders a single story export
storyView :: { mod :: Foreign, exportName :: String, layoutClass :: String, stageClass :: String } -> JSX
storyView = component "StoryView" \props -> React.do
  jsx <- unsafeRenderEffect $ unsafeGetProperty props.exportName props.mod
  pure $
    R.div { className: props.layoutClass <> " " <> props.stageClass, children: [ jsx ] }

-- Source code collapsible
sourceView :: Maybe StoryModule -> JSX
sourceView Nothing = mempty
sourceView (Just info) =
  details { style: S.sourceToggle }
    [ summary { style: S.sourceSummary } (text ("Source: " <> info.sourcePath))
    , element codeViewerComponent { code: info.sourceCode }
    ]
