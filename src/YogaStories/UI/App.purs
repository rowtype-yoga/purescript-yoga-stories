module YogaStories.UI.App where

import Prelude

import Yoga.JSON (writeJSON)
import YogaStories.Types (StoryModule)

renderHtml :: Array StoryModule -> String
renderHtml stories =
  """<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <title>yoga-stories</title>
  <script src="https://cdn.tailwindcss.com"></script>
</head>
<body class="m-0 bg-slate-900 text-slate-200 font-sans">
  <script id="stories-data" type="application/json">""" <> writeJSON stories <>
    """</script>
  <div id="app"></div>
  <script src="client.js" type="module"></script>
</body>
</html>"""
