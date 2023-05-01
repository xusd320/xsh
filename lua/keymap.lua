lvim.keys.normal_mode["<C-s>"] = ":w<cr>"
lvim.keys.normal_mode["<S-l>"] = ":BufferLineCycleNext<CR>"
lvim.keys.normal_mode["<S-h>"] = ":BufferLineCyclePrev<CR>"

lvim.lsp.buffer_mappings.normal_mode["gd"] = { "<cmd>Telescope lsp_definitions<cr>", "Goto definitions" }
lvim.lsp.buffer_mappings.normal_mode["gD"] = { vim.lsp.buf.declaration, "Goto declarations" }
lvim.lsp.buffer_mappings.normal_mode["gt"] = { "<cmd>Telescope lsp_type_definitions<cr>", "Goto type definitions" }
lvim.lsp.buffer_mappings.normal_mode["gi"] = { "<cmd>Telescope lsp_implementations<cr>", "Goto implementations" }
lvim.lsp.buffer_mappings.normal_mode["gr"] = { "<cmd>Telescope lsp_references<cr>", "Goto references" }
lvim.lsp.buffer_mappings.normal_mode["gD"] = nil

lvim.builtin.which_key.setup.plugins = {
  marks = true,
  registers = true,
  presets = {
    operators = true,
    motions = true,
    text_objects = true,
    windows = true,
    nav = true,
    z = true,
    g = true,
  },
  spelling = { enabled = true, suggestions = 20 },
}

lvim.builtin.which_key.mappings["c"] = nil

lvim.builtin.which_key.mappings["b"]["a"] = {
  "<cmd>:enew<cr>",
  "New Buffer",
}
lvim.builtin.which_key.mappings["b"]["c"] = {
  "<cmd>BufferKill<cr>",
  "Kill Buffer",
}
lvim.builtin.which_key.mappings["b"]["y"] = {
  "<cmd>:%y<cr>",
  "Copy Buffer",
}
lvim.builtin.which_key.mappings["b"]["d"] = {
  "<cmd>:%d<cr>",
  "Clear Buffer",
}

lvim.builtin.which_key.mappings["t"] = {
  name = "Telescope",
  t = {
    "<cmd>Telescope<cr>", "Toggle"
  },
  r = {
    "<cmd>Telescope resume<cr>", "Resume"
  },
  p = {
    "<cmd>Telescope projects<cr>", "Projects"
  }
}

lvim.builtin.which_key.mappings["s"]["R"] = {
  "<cmd>Spectre<cr>",
  "Search and Replace"
}
lvim.builtin.which_key.mappings["s"]["d"] = {
  "<cmd>Telescope grep_string<cr>", "Search word under cursor"
}

lvim.builtin.which_key.mappings["T"] = {
  "<cmd>ToggleTerm<cr>", "Toggle Term"
}

lvim.builtin.which_key.mappings["h"] = {
  "<cmd>DogeGenerate<cr>", "DogeGenerate"
}