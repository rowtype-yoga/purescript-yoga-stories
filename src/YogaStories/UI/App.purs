module YogaStories.UI.App where

import Prelude

import Data.Array (intercalate)
import Yoga.JSON (writeJSON)
import YogaStories.Types (StoryModule)

renderShell :: Array StoryModule -> String
renderShell stories = shell (writeJSON stories)

shell :: String -> String
shell storiesJson =
  """<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>yoga-stories</title>
  <script src="https://cdn.tailwindcss.com"></script>
  <script type="importmap">
  {
    "imports": {
      "react": "https://esm.sh/react@19?dev",
      "react-dom": "https://esm.sh/react-dom@19?dev",
      "react-dom/client": "https://esm.sh/react-dom@19/client?dev",
      "react/jsx-runtime": "https://esm.sh/react@19/jsx-runtime?dev",
      "leva": "https://esm.sh/leva@0.9?dev&external=react,react-dom",
      "react-spring": "https://esm.sh/react-spring@9?dev&external=react,react-dom",
      "@react-spring/web": "https://esm.sh/@react-spring/web@9?dev&external=react,react-dom"
    }
  }
  </script>
</head>
<body class="m-0 bg-slate-900 text-slate-200 font-sans">
  <div id="app"></div>
  <script type="module">
""" <> clientScript storiesJson <>
    """
  </script>
</body>
</html>"""

clientScript :: String -> String
clientScript storiesJson = intercalate "\n"
  [ "import React from 'react';"
  , "import { createRoot } from 'react-dom/client';"
  , "import { useControls, Leva } from 'leva';"
  , ""
  , "const { useState, useEffect, createElement: h } = React;"
  , ""
  , "const STORIES = " <> storiesJson <> ";"
  , ""
  , """
// Load a story module dynamically
async function loadStoryModule(moduleName) {
  const dirName = moduleName.replace(/\./g, '.');
  const mod = await import(`/output/${dirName}/index.js`);
  return mod;
}

// Component that renders a single story with leva controls
function StoryRenderer({ storyExport, storyName }) {
  const defaults = storyExport.defaults || {};
  const controls = useControls(storyName, defaults);
  return h('div', { className: 'p-4' },
    h(StoryComponent, { component: storyExport.component, props: controls })
  );
}

// Wrapper to catch render errors
function StoryComponent({ component, props }) {
  try {
    return component(props);
  } catch(e) {
    return h('div', { className: 'text-red-400 p-4 bg-red-950 rounded' }, 'Render error: ' + e.message);
  }
}

// Sidebar
function Sidebar({ stories, selected, onSelect }) {
  return h('nav', { className: 'w-64 border-r border-slate-700 overflow-y-auto py-3 shrink-0' },
    h('h2', { className: 'text-xs uppercase tracking-widest text-slate-500 px-4 mb-2' }, 'Stories'),
    stories.map(story =>
      h('div', { key: story.moduleName },
        h('div', { className: 'px-4 py-1 text-xs font-semibold text-indigo-400 mt-2' }, story.moduleName),
        story.exports.map(exp =>
          h('button', {
            key: exp,
            className: 'block w-full text-left px-6 py-1.5 text-sm ' +
              (selected === story.moduleName + '.' + exp
                ? 'text-white bg-slate-800'
                : 'text-slate-400 hover:text-indigo-300 hover:bg-slate-800'),
            onClick: () => onSelect(story.moduleName, exp)
          }, exp)
        )
      )
    )
  );
}

// Main panel showing the selected story
function MainPanel({ selectedModule, selectedExport, storyModules }) {
  const [mod, setMod] = useState(null);
  const [error, setError] = useState(null);

  useEffect(() => {
    if (!selectedModule) return;
    setMod(null);
    setError(null);
    loadStoryModule(selectedModule).then(setMod).catch(e => setError(e.message));
  }, [selectedModule]);

  if (!selectedModule) {
    return h('div', { className: 'flex-1 flex items-center justify-center text-slate-500' },
      'Select a story from the sidebar'
    );
  }

  if (error) {
    return h('div', { className: 'flex-1 p-6 text-red-400' }, 'Failed to load: ' + error);
  }

  if (!mod) {
    return h('div', { className: 'flex-1 p-6 text-slate-500' }, 'Loading...');
  }

  const storyExport = mod[selectedExport];
  if (!storyExport) {
    return h('div', { className: 'flex-1 p-6 text-red-400' }, 'Export "' + selectedExport + '" not found');
  }

  const storyInfo = storyModules.find(s => s.moduleName === selectedModule);
  const key = selectedModule + '.' + selectedExport;

  return h('div', { className: 'flex-1 overflow-y-auto' },
    h('div', { className: 'p-6' },
      h('h3', { className: 'text-indigo-400 text-base m-0 mb-4' }, key),
      h('div', { className: 'bg-slate-800 border border-slate-700 rounded-lg p-6 mb-6' },
        h(StoryRenderer, { key, storyExport, storyName: key })
      ),
      storyInfo ? h('details', { className: 'mt-4' },
        h('summary', { className: 'text-xs text-slate-500 cursor-pointer mb-2' }, 'Source: ' + storyInfo.sourcePath),
        h('pre', { className: 'bg-slate-950 border border-slate-700 rounded-md p-4 overflow-auto m-0' },
          h('code', { className: 'font-mono text-sm leading-relaxed text-slate-300' }, storyInfo.sourceCode)
        )
      ) : null
    )
  );
}

// App
function App() {
  const [selectedModule, setSelectedModule] = useState(null);
  const [selectedExport, setSelectedExport] = useState(null);

  const handleSelect = (mod, exp) => {
    setSelectedModule(mod);
    setSelectedExport(exp);
  };

  return h('div', { className: 'min-h-screen flex flex-col' },
    h('h1', { className: 'px-6 py-4 m-0 border-b border-slate-700 text-lg font-semibold text-indigo-400' }, 'yoga-stories'),
    h('div', { className: 'flex flex-1' },
      h(Sidebar, { stories: STORIES, selected: selectedModule + '.' + selectedExport, onSelect: handleSelect }),
      h(MainPanel, { selectedModule, selectedExport, storyModules: STORIES }),
      h(Leva, { collapsed: false, titleBar: { title: 'Props' } })
    )
  );
}

createRoot(document.getElementById('app')).render(h(App));
"""
  ]
