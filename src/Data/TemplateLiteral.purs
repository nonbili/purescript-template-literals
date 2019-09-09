module Data.TemplateLiteral
  ( template
  ) where

import Data.Argonaut.Core (Json)
import Data.Argonaut.Encode (class EncodeJson, encodeJson)
import Effect (Effect)

foreign import template_ :: String -> Json -> Effect String

template :: forall a. EncodeJson a => String -> a -> Effect String
template tpl params = template_ tpl (encodeJson params)
