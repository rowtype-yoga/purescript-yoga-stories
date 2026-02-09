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
import React.Basic.DOM.Client (createRoot, renderRoot)
import React.Basic.Events (handler_)
import React.Basic.Hooks as React
import React.Basic.Hooks.Internal (unsafeRenderEffect)
import Web.DOM (Element)
import Yoga.React (component)
import Yoga.React.DOM.HTML (button, code, details, div, h1, h2, h3, nav, pre, summary)
import Yoga.React.DOM.Internal (text)
import YogaStories.Types (StoryModule)

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
    div { className: "min-h-screen flex flex-col" }
      [ h1 { className: "px-6 py-4 m-0 border-b border-slate-700 text-lg font-semibold text-indigo-400" }
          "yoga-stories"
      , div { className: "flex flex-1" }
          [ sidebar
              { stories
              , selected: sel
              , onSelect: \m e -> setSel \_ -> { moduleName: Just m, exportName: Just e }
              }
          , mainPanel
              { selected: sel
              , stories
              }
          ]
      ]

-- Sidebar
sidebar :: { stories :: Array StoryModule, selected :: Selection, onSelect :: String -> String -> Effect Unit } -> JSX
sidebar = component "Sidebar" \props -> React.do
  pure $
    nav { className: "w-64 border-r border-slate-700 overflow-y-auto py-3 shrink-0" }
      [ h2 { className: "text-xs uppercase tracking-widest text-slate-500 px-4 mb-2" } "Stories"
      , div {} (map (moduleGroup props) props.stories)
      ]
  where
  moduleGroup props s =
    div {}
      [ div { className: "px-4 py-1 text-xs font-semibold text-indigo-400 mt-2" }
          (text s.moduleName)
      , div {} (map (exportBtn props s.moduleName) s.exports)
      ]

  exportBtn props modName expName = do
    let
      isSelected = props.selected.moduleName == Just modName
        && props.selected.exportName == Just expName
      cls = "block w-full text-left px-6 py-1.5 text-sm "
        <> if isSelected then "text-white bg-slate-800" else "text-slate-400 hover:text-indigo-300 hover:bg-slate-800"
    button
      { className: cls
      , onClick: handler_ (props.onSelect modName expName)
      }
      (text expName)

-- Main panel
mainPanel :: { selected :: Selection, stories :: Array StoryModule } -> JSX
mainPanel = component "MainPanel" \props -> React.do
  loaded /\ setLoaded <- React.useState (Nothing :: Maybe { name :: String, mod :: Foreign })

  React.useEffect props.selected.moduleName do
    case props.selected.moduleName of
      Nothing -> pure mempty
      Just modName -> do
        setLoaded \_ -> Nothing
        launchAff_ do
          mod <- toAffE (dynamicImportImpl ("/output/" <> modName <> "/index.js"))
          liftEffect $ setLoaded \_ -> Just { name: modName, mod }
        pure mempty

  pure case props.selected.moduleName, props.selected.exportName of
    Just modName, Just expName -> do
      let key = modName <> "." <> expName
      let info = find (\s -> s.moduleName == modName) props.stories
      case loaded of
        Nothing ->
          div { className: "flex-1 p-6 text-slate-500" } (text "Loading...")
        Just l ->
          div { className: "flex-1 overflow-y-auto p-6" }
            [ h3 { className: "text-indigo-400 text-base m-0 mb-4" } (text key)
            , storyView { mod: l.mod, exportName: expName }
            , sourceView info
            ]
    _, _ ->
      div { className: "flex-1 flex items-center justify-center text-slate-500" }
        (text "Select a story")

-- Renders a single story export
storyView :: { mod :: Foreign, exportName :: String } -> JSX
storyView = component "StoryView" \props -> React.do
  jsx <- unsafeRenderEffect $ unsafeGetProperty props.exportName props.mod
  pure $
    div { className: "bg-slate-800 border border-slate-700 rounded-lg p-6 mb-6" }
      [ jsx ]

-- Source code collapsible
sourceView :: Maybe StoryModule -> JSX
sourceView Nothing = mempty
sourceView (Just info) =
  details { className: "mt-4" }
    [ summary { className: "text-xs text-slate-500 cursor-pointer mb-2" }
        (text ("Source: " <> info.sourcePath))
    , pre { className: "bg-slate-950 border border-slate-700 rounded-md p-4 overflow-auto m-0" }
        [ code { className: "font-mono text-sm leading-relaxed text-slate-300" }
            (text info.sourceCode)
        ]
    ]
