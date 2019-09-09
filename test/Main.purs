module Test.Main where

import Prelude

import Data.Bifunctor (lmap)
import Data.Either (Either(..), isLeft)
import Data.TemplateLiteral (template)
import Effect (Effect)
import Effect.Class (liftEffect)
import Effect.Exception as E
import Jest (expectToBeTrue, expectToEqual, test)

main :: Effect Unit
main = do
  test "template" $ do
    out <- liftEffect $ template "${a} - ${b}" { a: "hello", b: 42 }
    expectToEqual out "hello - 42"

  test "template nested object" $ do
    let
      obj = { id: 1, name: "obj" }
    out <- liftEffect $ template "${obj.id} - ${obj.name}" { obj }
    expectToEqual out "1 - obj"

  test "error" $ do
    out <- liftEffect $ E.try $ template "${a} - ${b}" { a: "hello" }
    expectToEqual (lmap E.message out) (Left "b is not defined")
    expectToBeTrue $ isLeft out
