module Examples.Card.Stories where

import React.Basic (JSX)
import Examples.Card (mkCard)

type Story = { component :: { title :: String, body :: String } -> JSX, defaults :: { title :: String, body :: String } }

basic :: Story
basic = { component: mkCard, defaults: { title: "Hello", body: "This is a simple card component." } }

detailed :: Story
detailed = { component: mkCard, defaults: { title: "Project Update", body: "The new feature has been deployed to staging and is ready for review." } }
