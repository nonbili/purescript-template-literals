# purescript-template-literals

[ES2015 template literals](https://developer.mozilla.org/en-US/docs/Web/JavaScript/Reference/Template_literals) in PureScript

[![purescript-template-literals on Pursuit](https://pursuit.purescript.org/packages/purescript-template-literals/badge)](https://pursuit.purescript.org/packages/purescript-template-literals)

In `spago repl`

```
> import Data.TemplateLiteral
> template "Hello, ${t}!" { t: Just "world" }
"Hello, world!"

> template "${obj.id} - ${obj.name}" { obj : { id: 1, name: "obj" } }
"1 - obj"

> template' "${text} - ${tr(text)}!" { text: "hello", tr: String.toUpper }
"hello - HELLO"
```

## Development

```
yarn
spago build -w
yarn jest --watch
```
