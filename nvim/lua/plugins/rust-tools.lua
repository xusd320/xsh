return {
  {
    "simrat39/rust-tools.nvim",
    opts = {
      tools = {
        on_initialized = function() end,
      },
    },
    keys = {
      {
        "gm",
        function()
          require("rust-tools").expand_macro.expand_macro()
        end,
      },
      desc = "Expand rust macros",
    },
  },
}
