module YogaStories.UI.App where

import Prelude hiding (div)

import Yoga.React.DOM.HTML (div, h1, h2, h3, nav, pre, code, li, ul, a, main)
import Yoga.React.DOM.Internal (text)
import Yoga.React.DOM.Server (renderToStaticMarkup)
import React.Basic (JSX)
import YogaStories.Types (StoryModule)

renderApp :: Array StoryModule -> String
renderApp stories = wrapHtml (renderToStaticMarkup (app stories))

app :: Array StoryModule -> JSX
app stories =
  div { className: "min-h-screen bg-slate-900 text-slate-200 font-sans" }
    [ h1 { className: "px-6 py-4 m-0 border-b border-slate-700 text-lg font-semibold text-indigo-400" }
        "yoga-stories"
    , div { className: "flex h-[calc(100vh-57px)]" }
        [ sidebar stories
        , mainContent stories
        ]
    ]

sidebar :: Array StoryModule -> JSX
sidebar stories =
  nav { className: "w-64 border-r border-slate-700 overflow-y-auto py-3 shrink-0" }
    [ h2 { className: "text-xs uppercase tracking-widest text-slate-500 px-4 mb-2" }
        "Modules"
    , ul { className: "list-none p-0 m-0" }
        (map moduleLink stories)
    ]
  where
  moduleLink story =
    li {}
      [ a { href: "#" <> story.moduleName, className: "block px-4 py-1.5 text-slate-400 no-underline text-sm hover:text-indigo-300 hover:bg-slate-800" }
          (text story.moduleName)
      ]

mainContent :: Array StoryModule -> JSX
mainContent stories =
  main { className: "flex-1 overflow-y-auto p-6" }
    (map storySection stories)

storySection :: StoryModule -> JSX
storySection story =
  div { id: story.moduleName, className: "mb-8" }
    [ h3 { className: "text-indigo-400 text-base m-0 mb-2" }
        (text story.moduleName)
    , div { className: "text-xs text-slate-500 mb-3" }
        [ text ("Source: " <> story.sourcePath)
        , text (" | Exports: " <> show story.exports)
        ]
    , pre { className: "bg-slate-950 border border-slate-700 rounded-md p-4 overflow-auto m-0" }
        [ code { className: "font-mono text-sm leading-relaxed text-slate-300" }
            (text story.sourceCode)
        ]
    ]

wrapHtml :: String -> String
wrapHtml body =
  """<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>yoga-stories</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body>"""
    <> body
    <> "</body></html>"
