return {
  {
    "folke/snacks.nvim",
    opts = {
      picker = {
        sources = {
          explorer = {
            auto_close = true,
            jump = { close = true },
            layout = {
              preset = "vscode",
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
