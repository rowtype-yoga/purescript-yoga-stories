module YogaStories.UI.Styles where

import Prelude

import Yoga.React.DOM.Internal (CSS, css)

-- Layout
root :: CSS
root = css
  { minHeight: "100svh"
  , height: "100svh"
  , display: "flex"
  , flexDirection: "column"
  , overflow: "hidden"
  , fontFamily: "Inter, ui-sans-serif, system-ui, -apple-system, sans-serif"
  , backgroundColor: "#070a12"
  , backgroundImage: "radial-gradient(circle at 75% -10%, #172554 0%, transparent 34%), radial-gradient(circle at 5% 110%, #164e6338 0%, transparent 28%)"
  , color: "#e5e7eb"
  , margin: "0"
  }

row :: CSS
row = css { display: "flex", flex: "1", minHeight: "0", minWidth: "0" }

center :: CSS
center = css { display: "flex", alignItems: "center", justifyContent: "center" }

flex1 :: CSS
flex1 = css { flex: "1" }

-- Sidebar
sidebarNav :: CSS
sidebarNav = css
  { width: "288px"
  , borderRight: "1px solid #1f2937"
  , backgroundColor: "#090e18f2"
  , display: "flex"
  , flexDirection: "column"
  , flexShrink: "0"
  , boxShadow: "12px 0 40px #02061729"
  }

searchBox :: CSS
searchBox = css
  { padding: "12px 16px 14px"
  , borderBottom: "1px solid #182235"
  }

sidebarContent :: CSS
sidebarContent = css
  { flex: "1"
  , minHeight: "0"
  , overflowY: "auto"
  , padding: "14px 10px 20px"
  }

sidebarBranding :: CSS
sidebarBranding = css
  { padding: "12px 16px"
  , fontSize: "10px"
  , letterSpacing: "0.08em"
  , textTransform: "uppercase"
  , color: "#475569"
  , borderTop: "1px solid #182235"
  }

sidebarHeading :: CSS
sidebarHeading = css
  { fontSize: "10px"
  , fontWeight: "700"
  , textTransform: "uppercase"
  , letterSpacing: "0.12em"
  , color: "#526078"
  , padding: "0 8px"
  , marginBottom: "10px"
  }

moduleLabel :: CSS
moduleLabel = css
  { padding: "7px 10px"
  , fontSize: "12px"
  , fontWeight: "650"
  , color: "#a5b4fc"
  , marginTop: "5px"
  }

exportButton :: Boolean -> CSS
exportButton isSelected = css
  { display: "block"
  , width: "100%"
  , textAlign: "left"
  , padding: "8px 11px"
  , marginBottom: "2px"
  , fontSize: "12px"
  , fontWeight: if isSelected then "650" else "450"
  , border: if isSelected then "1px solid #38bdf84d" else "1px solid transparent"
  , borderRadius: "8px"
  , cursor: "pointer"
  , fontFamily: "inherit"
  , color: if isSelected then "#f8fafc" else "#94a3b8"
  , background: if isSelected then "linear-gradient(135deg, #164e63, #172554)" else "transparent"
  , boxShadow: if isSelected then "0 8px 24px #02061752" else "none"
  }

-- Main panel
panel :: CSS
panel = css
  { position: "relative"
  , flex: "1"
  , minWidth: "0"
  , overflowY: "auto"
  , padding: "0 28px 44px"
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
  , gap: "18px"
  , margin: "0 -28px 24px"
  , padding: "17px 28px"
  , borderBottom: "1px solid #1e293b"
  , background: "#070a12e8"
  , backdropFilter: "blur(18px)"
  }

storyTitle :: CSS
storyTitle = css { color: "#f8fafc", fontSize: "18px", fontWeight: "700", lineHeight: "1.25", margin: "2px 0 0" }

toolbarButtons :: CSS
toolbarButtons = css { display: "flex", gap: "8px", flexWrap: "wrap", justifyContent: "flex-end" }

layoutToggle :: CSS
layoutToggle = css
  { border: "1px solid #334155"
  , borderRadius: "8px"
  , background: "#111827"
  , color: "#cbd5e1"
  , padding: "7px 10px"
  , cursor: "pointer"
  , fontSize: "11px"
  , fontWeight: "650"
  , fontFamily: "inherit"
  , boxShadow: "0 4px 14px #0206173d"
  }

-- Source viewer
sourceToggle :: CSS
sourceToggle = css
  { marginTop: "10px"
  , border: "1px solid #243247"
  , borderRadius: "10px"
  , overflow: "hidden"
  , background: "#0a101c"
  }

sourceSummary :: CSS
sourceSummary = css
  { padding: "11px 13px"
  , fontSize: "11px"
  , fontWeight: "600"
  , color: "#94a3b8"
  , cursor: "pointer"
  , fontFamily: "ui-monospace, SFMono-Regular, Menlo, monospace"
  , overflowWrap: "anywhere"
  }

sourceBlock :: CSS
sourceBlock = css
  { backgroundColor: "#020617"
  , border: "1px solid #334155"
  , borderRadius: "8px"
  , padding: "16px"
  , overflow: "auto"
  , margin: "0"
  }

sourceCode :: CSS
sourceCode = css
  { borderTop: "1px solid #1e293b"
  , backgroundColor: "#050914"
  , fontFamily: "ui-monospace, SFMono-Regular, Menlo, monospace"
  , fontSize: "13px"
  , lineHeight: "1.65"
  , color: "#cbd5e1"
  }

-- Shared
brand :: CSS
brand = css
  { display: "flex"
  , alignItems: "center"
  , gap: "11px"
  , padding: "17px 16px 10px"
  }

brandMark :: CSS
brandMark = css
  { display: "flex"
  , alignItems: "center"
  , justifyContent: "center"
  , width: "30px"
  , height: "30px"
  , border: "1px solid #22d3ee66"
  , borderRadius: "9px"
  , background: "linear-gradient(145deg, #164e63, #172554)"
  , color: "#cffafe"
  , fontSize: "10px"
  , fontWeight: "800"
  , letterSpacing: "0.06em"
  , boxShadow: "0 8px 22px #02061780"
  }

brandName :: CSS
brandName = css { color: "#f8fafc", fontSize: "13px", fontWeight: "750", letterSpacing: "-0.01em" }

brandMeta :: CSS
brandMeta = css { color: "#64748b", fontSize: "10px", marginTop: "2px" }

emptyState :: CSS
emptyState = css
  { margin: "16px 8px"
  , padding: "14px"
  , border: "1px dashed #334155"
  , borderRadius: "9px"
  , color: "#64748b"
  , fontSize: "11px"
  , lineHeight: "1.5"
  }

storyEyebrow :: CSS
storyEyebrow = css
  { color: "#67e8f9"
  , fontSize: "9px"
  , fontWeight: "750"
  , letterSpacing: "0.13em"
  , textTransform: "uppercase"
  }

sourceGroup :: CSS
sourceGroup = css { marginTop: "18px", paddingTop: "2px" }

loadingState :: CSS
loadingState = panel <> center <> muted

muted :: CSS
muted = css { color: "#64748b" }
