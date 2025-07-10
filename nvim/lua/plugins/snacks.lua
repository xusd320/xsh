return {
  {
    "folke/snacks.nvim",
    opts = {
      explorer = {
        replace_netrw = true,
      },
      picker = {
        formatters = {
          file = {
            truncate = 100,
          },
        },
        previewers = {
          git = {
            native = true,
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
