local wk = require("which-key")

wk.add({
  { "<leader><Space>", group = "Telescope" },
  { "<leader><Space>r", "<cmd>Telescope resume<cr>", desc = "Resume" },
  { "<leader><Space>t", "<cmd>Telescope<cr>", desc = "Toggle" },
  { "<leader>fR", "<cmd>FzfLua oldfiles<cr>", desc = "Recent" },
  { "<leader>fr", LazyVim.pick("oldfiles", { cwd = vim.uv.cwd() }), desc = "Recent (cwd)" },
  { "gl", group = "Goto call hierarchy" },
  { "gli", "<cmd>Telescope lsp_incoming_calls<cr>", desc = "Goto incoming calls" },
  { "glo", "<cmd>Telescope lsp_outgoing_calls<cr>", desc = "Goto outgoing calls" },
  { "<leader>ba", "<cmd>:enew<cr>", desc = "New Buffer" },
  { "<leader>bx", "<cmd>:%d<cr>", desc = "Clear Buffer" },
  { "<leader>by", "<cmd>:%y<cr>", desc = "Copy Buffer" },
})
