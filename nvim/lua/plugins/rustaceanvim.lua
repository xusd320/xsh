return {
  {
    "mrcjkb/rustaceanvim",
    opts = {
      capabilities = {
        experimental = {
          snippetTextEdit = false,
        },
      },
      server = {
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
