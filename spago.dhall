{ name =
	"template-literals"
, dependencies =
	[ "argonaut-codecs", "effect", "console", "psci-support", "jest" ]
, packages =
	./packages.dhall
, sources =
	[ "src/**/*.purs", "test/**/*.purs" ]
}