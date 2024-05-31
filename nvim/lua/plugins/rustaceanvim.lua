vim.g.rustaceanvim = {
  server = {
    cmd = function()
      local mason_registry = require("mason-registry")
      local ra_binary = mason_registry.is_installed("rust-analyzer")
          and mason_registry.get_package("rust-analyzer"):get_install_path() .. "/rust-analyzer"
        or "rust-analyzer"
      return { ra_binary }
    end,
  },
}

return {
  {
    "mrcjkb/rustaceanvim",
    opts = {
      server = {
        capabilities = {
          experimental = {
            snippetTextEdit = false,
          },
        },
        default_settings = {
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
              command = "clippy",
              extraArgs = { "--no-deps" },
            },
            completion = {
              fullFunctionSignatures = true,
            },
            procMacro = {
              enable = true,
              ignored = {
                ["async-trait"] = { "async_trait" },
                ["napi-derive"] = { "napi" },
                ["async-recursion"] = { "async_recursion" },
              },
            },
          },
        },
      },
    },
    keys = {
      {
        "gm",
        function()
          vim.cmd.RustLsp("expandMacro")
        end,
        desc = "Expand rust macros",
      },
    },
  },
}
