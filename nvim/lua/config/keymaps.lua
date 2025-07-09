local wk = require("which-key")

wk.add({
  { "<leader>ba", "<cmd>:enew<cr>", desc = "New Buffer" },
  { "<leader>bx", "<cmd>:%d<cr>", desc = "Clear Buffer" },
  { "<leader>by", "<cmd>:%y<cr>", desc = "Copy Buffer" },
  { "<leader>\\", "<cmd>e #<cr>", desc = "Switch to Other Buffer" },
})

vim.keymap.del("n", "<leader>`")
