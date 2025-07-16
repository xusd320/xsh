return {
  {
    "folke/snacks.nvim",
    opts = {
      explorer = {
        replace_netrw = true,
      },
      terminal = {
        win = {
          position = "float",
          border = "rounded",
        },
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
      styles = {
        input = {
          relative = "cursor",
          row = 1,
        },
      },
    },
  },
}
