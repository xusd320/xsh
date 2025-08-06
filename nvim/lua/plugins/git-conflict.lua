return {
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
