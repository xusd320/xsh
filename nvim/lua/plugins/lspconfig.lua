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
    capabilities = {
      textDocument = {
        foldingRange = {
          dynamicRegistration = false,
          lineFoldingOnly = true,
        },
      },
    },
    servers = {
      eslint = {
        root_dir = get_typescript_root_dir,
      },
      tsserver = {
        root_dir = get_typescript_root_dir,
      },
      rust_analyzer = {
        settings = {
          ["rust-analyzer"] = {
            cachePriming = {
              enable = false,
            },
            cargo = {
              allFeatures = false,
            },
            check = {
              allTargets = false,
            },
            checkOnSave = {
              allFeatures = false,
            },
            completion = {
              fullFunctionSignatures = true,
              termSearch = {
                enable = true,
              },
            },
            diagnostics = {
              experimental = {
                enable = true,
              },
            },
            hover = {
              actions = {
                enable = false,
              },
            },
            lens = {
              enable = false,
            },
          },
        },
      },
    },
  },
}
