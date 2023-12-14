-- local util = require "lspconfig.util"

-- return {
-- root_dir = function(fname)
--   return util.root_pattern("tsconfig.base.json", "tsconfig.json")(fname)
--     or util.root_pattern("package.json", "jsconfig.json", ".git")(fname)
-- end,
-- }
return function(opts)
  opts.root_dir = require("lspconfig.util").root_pattern "package.json"
  return opts
end
