return {
  -- Git Blame
  {
    "f-person/git-blame.nvim",
    event = { "BufRead", "BufNewFile" },
    opts = function()
      local hl_cursor_line = vim.api.nvim_get_hl(0, { name = "CursorLine" })
      local hl_comment = vim.api.nvim_get_hl(0, { name = "Comment" })
      local hl_combined = vim.tbl_extend("force", hl_comment, { bg = hl_cursor_line.bg })
      vim.api.nvim_set_hl(0, "CursorLineBlame", hl_combined)
      return {
        enabled = true,
        highlight_group = "CursorLineBlame",
        message_template = "<summary> • <date> • <author> • <<sha>>",
        date_format = "%m-%d-%Y %H:%M",
        virtual_text_column = 1,
      }
    end,
  },

  -- Git Conflict
  {
    "akinsho/git-conflict.nvim",
    event = { "BufRead", "BufNewFile" },
    tag = "v2.1.0",
    opts = {
      default_mappings = false,
      default_commands = true,
      disable_diagnostics = false,
    },
    keys = {
      { "<leader>gco", ":GitConflictChooseOurs<cr>" },
      { "<leader>gct", ":GitConflictChooseTheirs<cr>" },
      { "<leader>gcb", ":GitConflictChooseBoth<cr>" },
      { "<leader>gc0", ":GitConflictChooseNone<cr>" },
      { "]x", ":GitConflictNextConflict<cr>" },
      { "[x", ":GitConflictPrevConflict<cr>" },
    },
  },
}
