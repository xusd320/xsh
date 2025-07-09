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
            layout = {
              preset = "right",
              auto_hide = { "input" },
            },
          },
          recent = {
            filter = {
              cwd = true,
            },
          },
        },
      },
    },
  },
}
