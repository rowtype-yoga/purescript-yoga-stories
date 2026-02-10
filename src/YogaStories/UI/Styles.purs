module YogaStories.UI.Styles where

import Prelude

import Yoga.React.DOM.Internal (CSS, css)

-- Layout
root :: CSS
root = css
  { minHeight: "100vh"
  , display: "flex"
  , flexDirection: "column"
  , fontFamily: "system-ui, -apple-system, sans-serif"
  , backgroundColor: "#0f172a"
  , color: "#e2e8f0"
  , margin: "0"
  }

row :: CSS
row = css { display: "flex", flex: "1" }

center :: CSS
center = css { display: "flex", alignItems: "center", justifyContent: "center" }

flex1 :: CSS
flex1 = css { flex: "1" }

-- Header
headerBar :: CSS
headerBar = css
  { padding: "16px 24px"
  , margin: "0"
  , borderBottom: "1px solid #334155"
  , fontSize: "18px"
  , fontWeight: "600"
  , color: "#818cf8"
  }

-- Sidebar
sidebarNav :: CSS
sidebarNav = css
  { width: "256px"
  , borderRight: "1px solid #334155"
  , overflowY: "auto"
  , padding: "12px 0"
  , flexShrink: "0"
  }

sidebarHeading :: CSS
sidebarHeading = css
  { fontSize: "11px"
  , textTransform: "uppercase"
  , letterSpacing: "0.1em"
  , color: "#64748b"
  , padding: "0 16px"
  , marginBottom: "8px"
  }

moduleLabel :: CSS
moduleLabel = css
  { padding: "4px 16px"
  , fontSize: "12px"
  , fontWeight: "600"
  , color: "#818cf8"
  , marginTop: "8px"
  }

exportButton :: Boolean -> CSS
exportButton isSelected = css
  { display: "block"
  , width: "100%"
  , textAlign: "left"
  , padding: "6px 24px"
  , fontSize: "14px"
  , border: "none"
  , cursor: "pointer"
  , fontFamily: "inherit"
  , color: if isSelected then "#ffffff" else "#94a3b8"
  , backgroundColor: if isSelected then "#1e293b" else "transparent"
  }

-- Main panel
panel :: CSS
panel = css { flex: "1", overflowY: "auto", padding: "24px" }

panelPlaceholder :: CSS
panelPlaceholder = flex1 <> center <> muted

storyHeader :: CSS
storyHeader = css
  { display: "flex"
  , alignItems: "center"
  , justifyContent: "space-between"
  , marginBottom: "16px"
  }

storyTitle :: CSS
storyTitle = css { color: "#818cf8", fontSize: "16px", margin: "0" }

layoutToggle :: CSS
layoutToggle = css
  { border: "1px solid #334155"
  , borderRadius: "4px"
  , background: "#1e293b"
  , color: "#94a3b8"
  , padding: "4px 8px"
  , cursor: "pointer"
  , fontSize: "14px"
  , fontFamily: "inherit"
  }

-- Source viewer
sourceToggle :: CSS
sourceToggle = css { marginTop: "16px" }

sourceSummary :: CSS
sourceSummary = css { fontSize: "12px", color: "#64748b", cursor: "pointer", marginBottom: "8px" }

sourceBlock :: CSS
sourceBlock = css
  { backgroundColor: "#020617"
  , border: "1px solid #334155"
  , borderRadius: "6px"
  , padding: "16px"
  , overflow: "auto"
  , margin: "0"
  }

sourceCode :: CSS
sourceCode = css
  { fontFamily: "ui-monospace, monospace"
  , fontSize: "14px"
  , lineHeight: "1.6"
  , color: "#cbd5e1"
  }

-- Shared
muted :: CSS
muted = css { color: "#64748b" }
