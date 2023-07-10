local util = require "lspconfig.util"

return {
  root_dir = function(fname)
    return util.root_pattern("tsconfig.base.json", "tsconfig.json")(fname)
      or util.root_pattern("package.json", "jsconfig.json", ".git")(fname)
  end,
}
