import React from "react";
import CodeMirror from "@uiw/react-codemirror";
import { StreamLanguage } from "@codemirror/language";
import { haskell } from "@codemirror/legacy-modes/mode/haskell";
import { tokyoNight } from "@uiw/codemirror-theme-tokyo-night";
import { EditorView } from "@codemirror/view";

const haskellLang = StreamLanguage.define(haskell);

const noEditableExt = EditorView.editable.of(false);

const fontTheme = EditorView.theme({
  ".cm-scroller": { fontFamily: "'JetBrains Mono', ui-monospace, monospace" },
});

export function CodeViewer({ code }) {
  return React.createElement(CodeMirror, {
    value: code,
    theme: tokyoNight,
    extensions: [haskellLang, noEditableExt, fontTheme],
    basicSetup: { lineNumbers: true, foldGutter: false, highlightActiveLine: false },
    editable: false,
  });
}

window.__yogaStoriesCodeViewer = CodeViewer;
