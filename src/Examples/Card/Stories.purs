module Examples.Card.Stories where

import React.Basic (JSX)
import Examples.Card (mkCard)
import YogaStories.Story (story)

basic :: JSX
basic = story "basic" mkCard { title: "Hello", body: "This is a simple card component." }

detailed :: JSX
detailed = story "detailed" mkCard { title: "Project Update", body: "The new feature has been deployed to staging and is ready for review." }
