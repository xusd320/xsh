return {
  {
    "mrcjkb/rustaceanvim",
    enabled = false,
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
