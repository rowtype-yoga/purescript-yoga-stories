module YogaStories.UI.Client where

import Prelude hiding (div)

import Data.Array as Array
import Data.Nullable (toMaybe)
import Data.Array (find)
import Data.Maybe (Maybe(..), fromMaybe)
import Data.Tuple.Nested ((/\))
import Effect (Effect)
import Effect.Ref as Ref
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
import React.Basic.Hooks (keyed)
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
foreign import detailsElImpl :: Boolean -> Array JSX -> JSX
foreign import summaryElImpl :: JSX -> JSX

unsafeGetProperty :: String -> Foreign -> Effect JSX
unsafeGetProperty = runEffectFn2 unsafeGetPropertyImpl

detailsEl :: Boolean -> Array JSX -> JSX
detailsEl = detailsElImpl

summaryEl :: JSX -> JSX
summaryEl = summaryElImpl

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

  let selected = autoSelect stories sel

  pure $
    div { className: "ys-shell", style: S.root }
      [ div { className: "ys-workspace", style: S.row }
          [ sidebar { stories, selected, onSelect }
          , mainPanel { selected, stories }
          ]
      ]

-- When no story is selected, pick the first available story
autoSelect :: Array StoryModule -> Selection -> Selection
autoSelect stories sel = case sel.moduleName, sel.exportName of
  Nothing, Nothing -> firstStory stories
  Just modName, Nothing -> case find (\s -> s.moduleName == modName) stories of
    Just s -> { moduleName: Just modName, exportName: preferDefault s.exports }
    Nothing -> firstStory stories
  _, _ -> sel
  where
  firstStory ss = case Array.head ss of
    Just s -> { moduleName: Just s.moduleName, exportName: preferDefault s.exports }
    Nothing -> sel
  preferDefault exports = case find (_ == "default") exports of
    Just d -> Just d
    Nothing -> Array.head exports

-- Sidebar
sidebar :: { stories :: Array StoryModule, selected :: Selection, onSelect :: String -> String -> Effect Unit } -> JSX
sidebar = component "Sidebar" \props -> React.do
  query /\ setQuery <- React.useState' ""
  let needle = String.toLower query
  let
    storyCount = Array.foldl (\count storyModule -> count + Array.length storyModule.exports) 0 props.stories
    filtered = props.stories # Array.filter \s ->
      String.contains (String.Pattern needle) (String.toLower s.moduleName)
        || Array.any (String.contains (String.Pattern needle) <<< String.toLower) s.exports
  pure $
    nav { className: "ys-sidebar", style: S.sidebarNav }
      [ div { style: S.brand }
          [ div { style: S.brandMark } (text "YS")
          , div {}
              [ div { style: S.brandName } (text "Yoga Stories")
              , div { style: S.brandMeta } (text (show storyCount <> " stories in this workspace"))
              ]
          ]
      , div { style: S.searchBox }
          [ R.input
              { type: "text"
              , placeholder: "Find a story…"
              , value: query
              , onChange: handler targetValue \v -> case v of
                  Just q -> setQuery q
                  _ -> pure unit
              , className: "ys-search-input"
              }
          ]
      , div { style: S.sidebarContent }
          [ div { style: S.sidebarHeading } (text "Library")
          , if Array.null filtered then
              div { style: S.emptyState } (text "No stories match this search.")
            else
              div {} (map (moduleGroup props) filtered)
          ]
      , div { style: S.sidebarBranding } (text "Local component workshop")
      ]
  where
  moduleGroup props s = do
    let label = moduleDisplayName s.moduleName
    let isSelected = props.selected.moduleName == Just s.moduleName
    case s.exports of
      [ expName ] | isPrimaryExport label expName ->
        button
          { style: S.exportButton isSelected
          , onClick: handler_ (props.onSelect s.moduleName expName)
          }
          (text label)
      _ ->
        detailsEl isSelected
          [ summaryEl (text label)
          , div {} (map (exportBtn props s.moduleName) s.exports)
          ]

  exportBtn props modName expName = do
    let isSelected = props.selected.moduleName == Just modName && props.selected.exportName == Just expName
    button
      { style: S.exportButton isSelected
      , onClick: handler_ (props.onSelect modName expName)
      }
      (text expName)

moduleDisplayName :: String -> String
moduleDisplayName name =
  let
    withoutPrefix = fromMaybe name (String.stripPrefix (String.Pattern "Test.Stories.") name)
  in
    fromMaybe withoutPrefix (String.stripSuffix (String.Pattern ".Stories") withoutPrefix)

isPrimaryExport :: String -> String -> Boolean
isPrimaryExport label exportName =
  exportName == "default" || String.toLower exportName == String.toLower label

-- Main panel
mainPanel :: { selected :: Selection, stories :: Array StoryModule } -> JSX
mainPanel = component "MainPanel" \props -> React.do
  loaded /\ setLoaded <- React.useState (Nothing :: Maybe { name :: String, mod :: Foreign })
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
        active <- Ref.new true
        setLoaded (const Nothing)
        launchAff_ do
          mod <- toAffE (dynamicImportImpl ("/output/" <> modName <> "/index.js"))
          stillActive <- liftEffect (Ref.read active)
          when stillActive $ liftEffect $ setLoaded \_ -> Just { name: modName, mod }
        pure (Ref.write false active)

  layoutRight /\ setLayoutRight <- React.useState' true
  let layoutClass = if layoutRight then "ys-layout-right" else "ys-layout-bottom"
  let stageClass = if stageDark then "ys-stage-dark" else "ys-stage-light"
  let stageLabel = if stageDark then "Light stage" else "Dark stage"
  let toggleLabel = if layoutRight then "Controls below" else "Controls right"

  pure case props.selected.moduleName, props.selected.exportName of
    Just modName, Just expName -> do
      let label = moduleDisplayName modName
      let key = if isPrimaryExport label expName then label else label <> " / " <> expName
      let info = find (\s -> s.moduleName == modName) props.stories
      case loaded of
        Just l | l.name == modName ->
          div { className: "ys-main", style: S.panel }
            [ div { className: "ys-story-header", style: S.storyHeader }
                [ div {}
                    [ div { style: S.storyEyebrow } (text "Story preview")
                    , h3 { style: S.storyTitle } (text key)
                    ]
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
            , keyed (modName <> "/" <> expName) (storyView { mod: l.mod, exportName: expName, layoutClass, stageClass })
            , sourceView info
            ]
        _ ->
          div { className: "ys-main", style: S.loadingState } (text "Loading story…")
    _, _ ->
      div { className: "ys-main", style: S.panelPlaceholder } (text "Choose a story from the library.")

-- Renders a single story export
storyView :: { mod :: Foreign, exportName :: String, layoutClass :: String, stageClass :: String } -> JSX
storyView = component "StoryView" \props -> React.do
  jsx <- unsafeRenderEffect $ unsafeGetProperty props.exportName props.mod
  pure $
    R.div { className: "ys-story-frame " <> props.layoutClass <> " " <> props.stageClass, children: [ jsx ] }

-- Source code collapsible
sourceView :: Maybe StoryModule -> JSX
sourceView Nothing = mempty
sourceView (Just info) = do
  let label = moduleDisplayName info.moduleName
  div { style: S.sourceGroup }
    [ div { style: S.storyEyebrow } (text "Source")
    , case toMaybe info.componentSourceCode of
        Nothing -> mempty
        Just code ->
          details { className: "ys-source-card", style: S.sourceToggle }
            [ summary { style: S.sourceSummary } (text ("Component source · " <> label))
            , div { style: S.sourceCode } [ element codeViewerComponent { code } ]
            ]
    , details { className: "ys-source-card", style: S.sourceToggle }
        [ summary { style: S.sourceSummary } (text ("Story source · " <> info.sourcePath))
        , div { style: S.sourceCode } [ element codeViewerComponent { code: info.sourceCode } ]
        ]
    ]
