module YogaStories.UI.Styles where

import Prelude

import Yoga.React.DOM.Internal (CSS, css)

root :: CSS
root = css
  { minHeight: "100svh"
  , height: "100svh"
  , display: "flex"
  , flexDirection: "column"
  , overflow: "hidden"
  , fontFamily: "ui-sans-serif, system-ui, -apple-system, BlinkMacSystemFont, sans-serif"
  , backgroundColor: "#151515"
  , color: "#d4d4d4"
  , margin: "0"
  }

row :: CSS
row = css { display: "flex", flex: "1", minHeight: "0", minWidth: "0" }

center :: CSS
center = css { display: "flex", alignItems: "center", justifyContent: "center" }

sidebarNav :: CSS
sidebarNav = css
  { width: "240px"
  , borderRight: "1px solid #303030"
  , backgroundColor: "#1b1b1b"
  , display: "flex"
  , flexDirection: "column"
  , flexShrink: "0"
  }

searchBox :: CSS
searchBox = css
  { padding: "5px 8px 7px"
  , borderBottom: "1px solid #303030"
  }

sidebarContent :: CSS
sidebarContent = css
  { flex: "1"
  , minHeight: "0"
  , overflowY: "auto"
  , padding: "5px 6px 12px"
  }

exportButton :: Boolean -> CSS
exportButton isSelected = css
  { display: "block"
  , width: "100%"
  , textAlign: "left"
  , padding: "4px 7px"
  , marginBottom: "1px"
  , fontSize: "12px"
  , lineHeight: "1.35"
  , fontWeight: if isSelected then "600" else "400"
  , border: "0"
  , borderLeft: if isSelected then "2px solid #b3b3b3" else "2px solid transparent"
  , borderRadius: "2px"
  , cursor: "pointer"
  , fontFamily: "inherit"
  , color: if isSelected then "#f2f2f2" else "#a3a3a3"
  , background: if isSelected then "#2a2a2a" else "transparent"
  }

panel :: CSS
panel = css
  { position: "relative"
  , flex: "1"
  , minWidth: "0"
  , overflowY: "auto"
  , padding: "0 16px 20px"
  }

panelPlaceholder :: CSS
panelPlaceholder = panel <> center <> muted

storyHeader :: CSS
storyHeader = css
  { position: "sticky"
  , top: "0"
  , zIndex: "20"
  , display: "flex"
  , alignItems: "center"
  , justifyContent: "space-between"
  , gap: "10px"
  , margin: "0 -16px 10px"
  , padding: "7px 16px"
  , borderBottom: "1px solid #303030"
  , background: "#151515"
  }

storyTitle :: CSS
storyTitle = css
  { color: "#ededed"
  , fontSize: "14px"
  , fontWeight: "600"
  , lineHeight: "1.3"
  , margin: "0"
  }

toolbarButtons :: CSS
toolbarButtons = css { display: "flex", gap: "4px", flexWrap: "wrap", justifyContent: "flex-end" }

layoutToggle :: CSS
layoutToggle = css
  { border: "1px solid #3b3b3b"
  , borderRadius: "3px"
  , background: "#202020"
  , color: "#c4c4c4"
  , padding: "3px 6px"
  , cursor: "pointer"
  , fontSize: "11px"
  , lineHeight: "1.35"
  , fontWeight: "500"
  , fontFamily: "inherit"
  }

sourceToggle :: CSS
sourceToggle = css
  { marginTop: "5px"
  , border: "1px solid #303030"
  , borderRadius: "3px"
  , overflow: "hidden"
  , background: "#191919"
  }

sourceSummary :: CSS
sourceSummary = css
  { padding: "5px 7px"
  , fontSize: "11px"
  , fontWeight: "400"
  , color: "#999999"
  , cursor: "pointer"
  , fontFamily: "ui-monospace, SFMono-Regular, Menlo, monospace"
  , overflowWrap: "anywhere"
  }

sourceCode :: CSS
sourceCode = css
  { borderTop: "1px solid #303030"
  , backgroundColor: "#111111"
  , fontFamily: "ui-monospace, SFMono-Regular, Menlo, monospace"
  , fontSize: "12px"
  , lineHeight: "1.5"
  , color: "#d0d0d0"
  }

brand :: CSS
brand = css
  { display: "flex"
  , alignItems: "baseline"
  , justifyContent: "space-between"
  , gap: "8px"
  , padding: "9px 10px 7px"
  , borderBottom: "1px solid #303030"
  }

brandName :: CSS
brandName = css { color: "#ededed", fontSize: "13px", fontWeight: "600" }

brandMeta :: CSS
brandMeta = css { color: "#777777", fontSize: "10px" }

emptyState :: CSS
emptyState = css
  { padding: "7px"
  , color: "#777777"
  , fontSize: "11px"
  , lineHeight: "1.4"
  }

sourceGroup :: CSS
sourceGroup = css { marginTop: "8px" }

loadingState :: CSS
loadingState = panel <> center <> muted

muted :: CSS
muted = css { color: "#777777" }
