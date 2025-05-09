local get_git_root_dir = function(fname)
  local util = require("lspconfig.util")
  return util.root_pattern(".git")(fname)
end

local get_typescript_root_dir = function(fname)
  local util = require("lspconfig.util")
  return get_git_root_dir(fname) or util.root_pattern("package.json", "tsconfig.json")(fname)
end

return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      capabilities = {
        textDocument = {
          foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true,
          },
        },
      },
      document_highlight = {
        enabled = true,
      },
      inlay_hints = {
        enabled = false,
      },
      servers = {
        -- eslint = {
        --   root_dir = get_typescript_root_dir,
        -- },
        vtsls = {
          root_dir = get_typescript_root_dir,
        },
      },
    },
    -- FIXME: https://github.com/LazyVim/LazyVim/issues/6039
    { "mason-org/mason.nvim", version = "1" },
    { "mason-org/mason-lspconfig.nvim", version = "1" },
  },
}
