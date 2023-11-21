return {
  {
    "TabbyML/vim-tabby",
    lazy = false,
    config = function()
      vim.g.tabby_node_binary = vim.fn.expand("~/.nvm/versions/node/v18.18.2/bin/node")
      vim.g.tabby_keybinding_accept = "<C-Tab>"
      vim.g.tabby_keybinding_trigger_or_dismiss = "<C-\\>"
    end,
  },
}
