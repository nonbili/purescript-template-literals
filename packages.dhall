let upstream =
	  https://github.com/purescript/package-sets/releases/download/psc-0.13.2-20190804/packages.dhall sha256:2230fc547841b54bca815eb0058414aa03ed7b675042f8b3dda644e1952824e5

let overrides = {=}

let additions =
	  { jest =
		  { dependencies =
			  [ "effect", "aff", "aff-promise" ]
		  , repo =
			  "https://github.com/nonbili/purescript-jest.git"
		  , version =
			  "v0.3.0"
		  }
	  }

in  upstream ⫽ overrides ⫽ additions