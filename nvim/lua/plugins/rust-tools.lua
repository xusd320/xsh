return {
  {
    "simrat39/rust-tools.nvim",
    opts = {
      server = {
        standalone = false,
      },
      tools = {
        on_initialized = function() end,
        inlay_hints = {
          auto = false,
          show_parameter_hints = false,
        },
      },
    },
    keys = {
      {
        "gm",
        function()
          require("rust-tools").expand_macro.expand_macro()
        end,
        desc = "Expand rust macros",
      },
    },
  },
}
