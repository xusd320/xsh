local get_git_root_dir = function(fname)
  local util = require("lspconfig.util")
  return util.root_pattern(".git")(fname)
end

local get_typescript_root_dir = function(fname)
  local util = require("lspconfig.util")
  return get_git_root_dir(fname) or util.root_pattern("package.json", "tsconfig.json")(fname)
end

return {
  "neovim/nvim-lspconfig",
  opts = {
    inlay_hints = {
      enabled = false,
    },
    capabilities = {
      textDocument = {
        foldingRange = {
          dynamicRegistration = false,
          lineFoldingOnly = true,
        },
      },
    },
    servers = {
      -- eslint = {
      --   root_dir = get_typescript_root_dir,
      -- },
      vtsls = {
        root_dir = get_typescript_root_dir,
      },
    },
    setup = {
      -- rust_analyzer will be setup by rustacean
      rust_analyzer = function()
        return true
      end,
    },
  },
}
