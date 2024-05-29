return {
  {
    "mrcjkb/rustaceanvim",
    -- disbable https://github.com/mrcjkb/rustaceanvim/pull/316
    commit = "2b0377e",
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
