module Examples.Card.Stories where

import Examples.Card (mkCard)
import React.Basic (JSX)

basic :: JSX
basic = mkCard { title: "Hello", body: "This is a simple card component." }

detailed :: JSX
detailed = mkCard { title: "Project Update", body: "The new feature has been deployed to staging and is ready for review." }
