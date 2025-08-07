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
            auto_close = true,
            layout = {
              auto_hide = { "input" },
              preview = true,
              layout = {
                box = "horizontal",
                position = "float",
                height = 0.95,
                width = 0,
                border = "rounded",
                {
                  box = "vertical",
                  width = 40,
                  min_width = 40,
                  { win = "input", height = 1, title = "{title} {live} {flags}", border = "single" },
                  { win = "list" },
                },
                { win = "preview", width = 0, border = "left" },
              },
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
    -- config = function()
    --   vim.api.nvim_create_autocmd("ColorScheme", {
    --     pattern = "*",
    --     callback = function()
    --       vim.api.nvim_set_hl(0, "SnacksPicker", { bg = "none", nocombine = true })
    --       vim.api.nvim_set_hl(0, "SnacksPickerBorder", { fg = "#316c71", bg = "none", nocombine = true })
    --     end,
    --   })
    -- end,
  },
}
