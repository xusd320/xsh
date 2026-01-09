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
          { "filename", path = 1, symbols = { modified = "  ", readonly = "  ", unnamed = "  " } },
          {
            function()
              return require("aerial").get_location(true)
            end,
            cond = function()
              return package.loaded["aerial"] ~= nil
            end,
          },
        },
        lualine_x = {
          {
            function()
              local msg = "No Active LSP"
              local buf_ft = vim.api.nvim_get_current_buf()
              local clients = vim.lsp.get_active_clients({ bufnr = buf_ft })
              if next(clients) == nil then
                return msg
              end
              local client_names = {}
              for _, client in ipairs(clients) do
                table.insert(client_names, client.name)
              end
              return " " .. table.concat(client_names, " ")
            end,
            color = { fg = "#ffffff", gui = "bold" },
          },
          {
            function()
              local ok, codecompanion = pcall(require, "codecompanion")
              if ok then
                local status = codecompanion.status()
                if status == "processing" then
                  return " "
                end
              end
              return ""
            end,
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
