return {
  {
    "mrcjkb/rustaceanvim",
    opts = {
      server = {
        cmd = function()
          local mason_registry = require("mason-registry")
          local ra_binary = mason_registry.is_installed("rust-analyzer")
              and require("mason-core.path").bin_prefix("rust-analyzer")
            or "rust-analyzer"
          return { ra_binary }
        end,
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
            diagnostics = {
              enable = true,
              disabled = {
                "unresolved-proc-macro",
                "unlinked-file",
              },
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
