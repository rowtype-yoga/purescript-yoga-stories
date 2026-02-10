module YogaStories.UI.Client where

import Prelude hiding (div)

import Data.Array (find)
import Data.Maybe (Maybe(..))
import Data.Tuple.Nested ((/\))
import Effect (Effect)
import Effect.Aff (launchAff_)
import Effect.Class (liftEffect)
import Effect.Uncurried (EffectFn2, runEffectFn2)
import Foreign (Foreign)
import Promise (Promise)
import Promise.Aff (toAffE)
import React.Basic (JSX)
import React.Basic.DOM as R
import React.Basic.DOM.Client (createRoot, renderRoot)
import React.Basic.Events (handler_)
import React.Basic.Hooks as React
import React.Basic.Hooks.Internal (unsafeRenderEffect)
import Web.DOM (Element)
import Yoga.React (component)
import Yoga.React.DOM.HTML (button, code, details, div, h1, h2, h3, nav, pre, summary)
import Yoga.React.DOM.Internal (text)
import YogaStories.Types (StoryModule)
import YogaStories.UI.Styles as S

-- FFI
foreign import dynamicImportImpl :: String -> Effect (Promise Foreign)
foreign import fetchStoryDataImpl :: Effect (Promise (Array StoryModule))
foreign import unsafeGetPropertyImpl :: EffectFn2 String Foreign JSX
foreign import getElementByIdImpl :: String -> Effect Element

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

-- Types
type Selection = { moduleName :: Maybe String, exportName :: Maybe String }

noSelection :: Selection
noSelection = { moduleName: Nothing, exportName: Nothing }

-- App
app :: Array StoryModule -> JSX
app = component "App" \stories -> React.do
  sel /\ setSel <- React.useState noSelection
  pure $
    div { style: S.root }
      [ h1 { style: S.headerBar } "yoga-stories"
      , div { style: S.row }
          [ sidebar
              { stories
              , selected: sel
              , onSelect: \m e -> setSel \_ -> { moduleName: Just m, exportName: Just e }
              }
          , mainPanel { selected: sel, stories }
          ]
      ]

-- Sidebar
sidebar :: { stories :: Array StoryModule, selected :: Selection, onSelect :: String -> String -> Effect Unit } -> JSX
sidebar = component "Sidebar" \props -> React.do
  pure $
    nav { style: S.sidebarNav }
      [ h2 { style: S.sidebarHeading } "Stories"
      , div {} (map (moduleGroup props) props.stories)
      ]
  where
  moduleGroup props s =
    div {}
      [ div { style: S.moduleLabel } (text s.moduleName)
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

  React.useEffect props.selected.moduleName do
    case props.selected.moduleName of
      Nothing -> pure mempty
      Just modName -> do
        setLoaded \_ -> Nothing
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
    , pre { style: S.sourceBlock }
        [ code { style: S.sourceCode } (text info.sourceCode) ]
    ]
