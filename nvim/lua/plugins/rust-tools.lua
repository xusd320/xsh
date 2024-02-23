return {
  {
    "simrat39/rust-tools.nvim",
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
