local wk = require("which-key")

wk.register({
  ["<leader><Space>"] = {
    name = "Telescope",
    t = {
      "<cmd>Telescope<cr>",
      "Toggle",
    },
    r = {
      "<cmd>Telescope resume<cr>",
      "Resume",
    },
    p = {
      "<cmd>Telescope projects<cr>",
      "Projects",
    },
  },
  ["<leader>fr"] = {
    LazyVim.pick("oldfiles", { cwd = vim.uv.cwd() }),
    "Recent (cwd)",
  },
  ["<leader>fR"] = {
    "<cmd>FzfLua oldfiles<cr>",
    "Recent",
  },
  ["gl"] = {
    name = "Goto call hierarchy",
    i = {
      "<cmd>Telescope lsp_incoming_calls<cr>",
      "Goto incoming calls",
    },
    o = {
      "<cmd>Telescope lsp_outgoing_calls<cr>",
      "Goto outgoing calls",
    },
  },
})

wk.register({
  ["<leader>ba"] = {
    "<cmd>:enew<cr>",
    "New Buffer",
  },
  ["<leader>bx"] = {
    "<cmd>:%d<cr>",
    "Clear Buffer",
  },
  ["<leader>by"] = {
    "<cmd>:%y<cr>",
    "Copy Buffer",
  },
})
