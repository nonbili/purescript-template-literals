// Adapted from https://gist.github.com/malko/b8a432bbb2198ca5d38cd3dc27d40f24
exports.template_ = tpl => params => () =>
  new Function(
    "{" + Object.keys(params).join(",") + "}",
    "return `" + tpl + "`"
  )(params);
