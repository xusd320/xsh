return {
  {
    "folke/snacks.nvim",
    opts = {
      explorer = {
        replace_netrw = false,
      },
      picker = {
        formatters = {
          file = {
            truncate = 100,
          },
        },
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
