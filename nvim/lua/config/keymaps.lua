local wk = require("which-key")

wk.register({
  ["<leader>T"] = {
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
