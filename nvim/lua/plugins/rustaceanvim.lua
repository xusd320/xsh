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
