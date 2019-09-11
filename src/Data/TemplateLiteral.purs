module Data.TemplateLiteral
  ( template
  , template'
  ) where

import Prelude

import Data.Argonaut.Encode (class EncodeJson, encodeJson)
import Effect (Effect)
import Foreign (Foreign, unsafeToForeign)

foreign import template_ :: String -> Foreign -> Effect String

-- | The first argument is treated as template literals, and interpolated by the
-- | second argument. The second argument will be encoded to `Json` before
-- | passed through FFI.
-- |
-- | Example:
-- | ```purescript
-- | > template "Hello, ${t}!" { t: Just "world" }
-- | "Hello, world!"
-- | ```
template :: forall a. EncodeJson (Record a) => String -> Record a -> Effect String
template tpl params = template_ tpl (unsafeToForeign $ encodeJson params)

-- | The first argument is treated as template literals. The second argument
-- | will be coerced to `Foreign`.
-- |
-- | Example:
-- | ```purescript
-- | > template' "Hello, ${t}!" { t: Just "world" }
-- | "Hello, [ojbect Object]"
-- | > template' "${text} - ${tr(text)}!" { text: "hello", tr: String.toUpper }
-- | "hello - HELLO"
-- | ```
template' :: forall a. String -> Record a -> Effect String
template' tpl params = template_ tpl (unsafeToForeign params)
