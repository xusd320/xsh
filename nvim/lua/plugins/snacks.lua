return {
  {
    "folke/snacks.nvim",
    opts = {
      explorer = {
        replace_netrw = true,
      },
      picker = {
        sources = {
          explorer = {
            auto_close = true,
            jump = { close = true },
            layout = {
              preset = "right",
              auto_hide = { "input" },
            },
          },
          recent = {
            filter = {
              paths = false,
            },
          },
        },
      },
    },
  },
}
