module YogaStories.UI.App where

import Prelude

import Yoga.React.DOM.HTML (div, h1, h2, h3, nav, pre, code, li, ul, a, main)
import Yoga.React.DOM.Internal (css, text)
import Yoga.React.DOM.Server (renderToStaticMarkup)
import React.Basic (JSX)
import YogaStories.Types (StoryModule)

renderApp :: Array StoryModule -> String
renderApp stories = wrapHtml (renderToStaticMarkup (app stories))

app :: Array StoryModule -> JSX
app stories =
  div { style: appStyle }
    [ h1 { style: headerStyle } "yoga-stories"
    , div { style: layoutStyle }
        [ sidebar stories
        , mainContent stories
        ]
    ]
  where
  appStyle = css
    { fontFamily: "-apple-system, BlinkMacSystemFont, 'Segoe UI', sans-serif"
    , margin: "0"
    , padding: "0"
    , color: "#e0e0e0"
    , backgroundColor: "#1a1a2e"
    , minHeight: "100vh"
    }
  headerStyle = css
    { padding: "16px 24px"
    , margin: "0"
    , borderBottom: "1px solid #2a2a4a"
    , fontSize: "18px"
    , fontWeight: "600"
    , color: "#8b8bcd"
    }
  layoutStyle = css
    { display: "flex"
    , height: "calc(100vh - 57px)"
    }

sidebar :: Array StoryModule -> JSX
sidebar stories =
  nav { style: sidebarStyle }
    [ h2 { style: sidebarHeaderStyle } "Modules"
    , ul { style: listStyle } (map moduleLink stories)
    ]
  where
  sidebarStyle = css
    { width: "260px"
    , borderRight: "1px solid #2a2a4a"
    , overflowY: "auto"
    , padding: "12px 0"
    , flexShrink: "0"
    }
  sidebarHeaderStyle = css
    { fontSize: "12px"
    , textTransform: "uppercase"
    , letterSpacing: "1px"
    , color: "#6b6b9a"
    , padding: "0 16px"
    , margin: "0 0 8px 0"
    }
  listStyle = css
    { listStyle: "none"
    , padding: "0"
    , margin: "0"
    }
  moduleLink story =
    li {}
      [ a { href: "#" <> story.moduleName, style: linkStyle }
          (text story.moduleName)
      ]
  linkStyle = css
    { display: "block"
    , padding: "6px 16px"
    , color: "#b0b0d0"
    , textDecoration: "none"
    , fontSize: "13px"
    }

mainContent :: Array StoryModule -> JSX
mainContent stories =
  main { style: mainStyle }
    (map storySection stories)
  where
  mainStyle = css
    { flex: "1"
    , overflowY: "auto"
    , padding: "24px"
    }

storySection :: StoryModule -> JSX
storySection story =
  div { id: story.moduleName, style: sectionStyle }
    [ h3 { style: titleStyle } (text story.moduleName)
    , div { style: metaStyle }
        [ text ("Source: " <> story.sourcePath)
        , text (" | Exports: " <> show story.exports)
        ]
    , pre { style: preStyle }
        [ code { style: codeStyle } (text story.sourceCode) ]
    ]
  where
  sectionStyle = css
    { marginBottom: "32px"
    }
  titleStyle = css
    { color: "#8b8bcd"
    , fontSize: "16px"
    , margin: "0 0 8px 0"
    }
  metaStyle = css
    { fontSize: "12px"
    , color: "#6b6b9a"
    , marginBottom: "12px"
    }
  preStyle = css
    { backgroundColor: "#16162a"
    , border: "1px solid #2a2a4a"
    , borderRadius: "6px"
    , padding: "16px"
    , overflow: "auto"
    , margin: "0"
    }
  codeStyle = css
    { fontFamily: "'JetBrains Mono', 'Fira Code', 'SF Mono', monospace"
    , fontSize: "13px"
    , lineHeight: "1.5"
    , color: "#d0d0e8"
    }

wrapHtml :: String -> String
wrapHtml body =
  "<!DOCTYPE html>\
  \<html lang=\"en\">\
  \<head>\
  \<meta charset=\"utf-8\">\
  \<meta name=\"viewport\" content=\"width=device-width, initial-scale=1\">\
  \<title>yoga-stories</title>\
  \<style>* { box-sizing: border-box; } body { margin: 0; }</style>\
  \</head>\
  \<body>" <> body <> "</body></html>"
