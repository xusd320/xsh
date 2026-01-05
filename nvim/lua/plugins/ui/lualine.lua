return {
  "nvim-lualine/lualine.nvim",
  opts = function()
    local icons = {
      diagnostics = {
        Error = " ",
        Warn = " ",
        Hint = " ",
        Info = " ",
      },
      git = {
        branch = "",
        added = " ",
        modified = " ",
        removed = " ",
      },
    }

    return {
      options = {
        theme = "auto",
        globalstatus = true,
        component_separators = "",
        section_separators = { left = "", right = "" },
        disabled_filetypes = { statusline = { "dashboard", "alpha", "starter" } },
      },
      sections = {
        lualine_a = { { "mode", separator = { left = "" }, right_padding = 2 } },
        lualine_b = { { "branch", icon = icons.git.branch } },
        lualine_c = {
          {
            "diagnostics",
            symbols = icons.diagnostics,
          },
          { "filetype", icon_only = true, separator = "", padding = { left = 1, right = 0 } },
          { "filename", path = 1 },
        },
        lualine_x = {
          {
            function() return require("noice").api.status.command.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.command.has() end,
            color = { fg = "#ff9e64" },
          },
          {
            function() return require("noice").api.status.mode.get() end,
            cond = function() return package.loaded["noice"] and require("noice").api.status.mode.has() end,
            color = { fg = "#ff9e64" },
          },
          {
            "diff",
            symbols = icons.git,
            source = function()
              local gitsigns = vim.b.gitsigns_status_dict
              if gitsigns then
                return {
                  added = gitsigns.added,
                  modified = gitsigns.changed,
                  removed = gitsigns.removed,
                }
              end
            end,
          },
        },
        lualine_y = {
          { "progress", separator = " ", padding = { left = 1, right = 1 } },
          { "location", padding = { left = 0, right = 1 } },
        },
        lualine_z = {
          { function() return " " .. os.date("%R") end, separator = { right = "" }, left_padding = 2 },
        },
      },
    }
  end,
}
