-- | Same as `Data.TemplateLiteral`, but without `Effect` in return type.
module Data.TemplateLiteral.Unsafe
  ( template
  , template'
  ) where

import Prelude

import Data.Argonaut.Encode (class EncodeJson)
import Data.TemplateLiteral as L
import Effect.Unsafe (unsafePerformEffect)

template :: forall a. EncodeJson (Record a) => String -> Record a -> String
template t p = unsafePerformEffect $ L.template t p

template' :: forall a. String -> Record a -> String
template' t p = unsafePerformEffect $ L.template' t p
