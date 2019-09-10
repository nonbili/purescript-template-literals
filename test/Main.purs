module Test.Main where

import Prelude

import Data.Bifunctor (lmap)
import Data.Either (Either(..), isLeft)
import Data.Maybe (Maybe(..))
import Data.String as String
import Data.TemplateLiteral (template, template')
import Effect (Effect)
import Effect.Class (liftEffect)
import Effect.Exception as E
import Jest (expectToBeTrue, expectToEqual, test)

main :: Effect Unit
main = do
  test "template" $ do
    out <- liftEffect $ template "${a} - ${b}" { a: "hello", b: Just 42 }
    expectToEqual out "hello - 42"

  test "template with nested object" $ do
    let
      obj = { id: 1, name: "obj" }
    out <- liftEffect $ template "${obj.id} - ${obj.name}" { obj }
    expectToEqual out "1 - obj"

  test "template error" $ do
    out <- liftEffect $ E.try $ template "${a} - ${b}" { a: "hello" }
    expectToEqual (lmap E.message out) (Left "b is not defined")
    expectToBeTrue $ isLeft out

  test "template'" $ do
    out <- liftEffect $ template' "${a} - ${b}" { a: "hello", b: Just 42 }
    expectToEqual out "hello - [object Object]"

  test "template' with function" $ do
    out <- liftEffect $
      template' "${a} - ${render(a)}" { a: "hello", render: String.toUpper }
    expectToEqual out "hello - HELLO"
