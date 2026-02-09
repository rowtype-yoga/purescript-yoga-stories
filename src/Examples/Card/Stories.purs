module Examples.Card.Stories where

import React.Basic (JSX)
import Examples.Card (mkCard)
import YogaStories.Controls (color)
import YogaStories.Story (story)

basic :: JSX
basic = story "basic" mkCard
  { content:
      { title: "Hello"
      , body: "This is a simple card component."
      }
  , style:
      { border:
          { color: color "#334155"
          , visible: true
          }
      , background: color "#1e293b"
      , rounded: true
      }
  }

detailed :: JSX
detailed = story "detailed" mkCard
  { content:
      { title: "Project Update"
      , body: "The new feature has been deployed to staging and is ready for review."
      }
  , style:
      { border:
          { color: color "#6366f1"
          , visible: true
          }
      , background: color "#0f172a"
      , rounded: true
      }
  }
