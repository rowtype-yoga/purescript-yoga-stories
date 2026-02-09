module Test.Discovery where

import Prelude

import Test.Spec (Spec, describe, it)
import Test.Spec.Assertions (shouldEqual)
import YogaStories.Discovery (matchModuleGlob, filterModules)

spec :: Spec Unit
spec = describe "matchModuleGlob" do
  it "** matches any module" do
    matchModuleGlob "**" "Main" `shouldEqual` true
    matchModuleGlob "**" "Components.Button" `shouldEqual` true
    matchModuleGlob "**" "Components.Button.Large" `shouldEqual` true

  it "* matches exactly one segment" do
    matchModuleGlob "*" "Main" `shouldEqual` true
    matchModuleGlob "*" "Main.Sub" `shouldEqual` false

  it "Components.* matches one level deep" do
    matchModuleGlob "Components.*" "Components.Button" `shouldEqual` true
    matchModuleGlob "Components.*" "Components.Button.Large" `shouldEqual` false

  it "Components.** matches any depth" do
    matchModuleGlob "Components.**" "Components.Button" `shouldEqual` true
    matchModuleGlob "Components.**" "Components.Button.Large" `shouldEqual` true
    matchModuleGlob "Components.**" "Main" `shouldEqual` false

  it "exact match works" do
    matchModuleGlob "Main" "Main" `shouldEqual` true
    matchModuleGlob "Main" "Main.Sub" `shouldEqual` false
    matchModuleGlob "Main" "Other" `shouldEqual` false

  it "**.Internal.** matches internal modules at any depth" do
    matchModuleGlob "**.Internal.**" "Components.Internal.Helpers" `shouldEqual` true
    matchModuleGlob "**.Internal.**" "Internal.Core" `shouldEqual` true
    matchModuleGlob "**.Internal.**" "Components.Button" `shouldEqual` false

  it "filterModules applies include and exclude" do
    let config = { outputDir: "./output", include: [ "Components.**" ], exclude: [ "**.Internal.**" ] }
    let modules = [ "Components.Button", "Components.Internal.Helpers", "Main", "Components.Card" ]
    filterModules config modules `shouldEqual` [ "Components.Button", "Components.Card" ]
