module Data.TemplateLiteral.Unsafe
  ( template
  ) where

import Prelude

import Data.Argonaut.Encode (class EncodeJson)
import Data.TemplateLiteral as L
import Effect.Unsafe (unsafePerformEffect)

template :: forall a. EncodeJson a => String -> a -> String
template t p = unsafePerformEffect $ L.template t p
