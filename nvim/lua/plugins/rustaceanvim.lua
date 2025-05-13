return {
  {
    "mrcjkb/rustaceanvim",
    opts = {
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
              command = "clippy",
              extraArgs = { "--no-deps" },
            },
            checkOnSave = true,
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
