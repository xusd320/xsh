return {
  {
    "TabbyML/vim-tabby",
    enabled = false,
    lazy = false,
    dependencies = {
      "neovim/nvim-lspconfig",
    },
    init = function()
      vim.g.tabby_agent_start_command = { "npx", "tabby-agent", "--stdio" }
      vim.g.tabby_inline_completion_trigger = "auto"
      vim.g.tabby_inline_completion_keybinding_accept = "<C-Tab>"
      vim.g.tabby_inline_completion_keybinding_trigger_or_dismiss = "<C-\\>"
    end,
  },
}
