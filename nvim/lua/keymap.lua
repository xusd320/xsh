lvim.keys.normal_mode['<C-s>'] = ':w<cr>'
lvim.keys.normal_mode['<S-l>'] = ':BufferLineCycleNext<CR>'
lvim.keys.normal_mode['<S-h>'] = ':BufferLineCyclePrev<CR>'

lvim.lsp.buffer_mappings.normal_mode['gd'] = { '<cmd>Telescope lsp_definitions<cr>', 'Goto definitions' }
lvim.lsp.buffer_mappings.normal_mode['gD'] = { vim.lsp.buf.declaration, 'Goto declarations' }
lvim.lsp.buffer_mappings.normal_mode['gt'] = { '<cmd>Telescope lsp_type_definitions<cr>', 'Goto type definitions' }
vim.keymap.set('n', 'gi', '<cmd>echo "Goto implementations"<cr>', { desc = 'Goto implementations' })
lvim.lsp.buffer_mappings.normal_mode['gi'] = { '<cmd>Telescope lsp_implementations<cr>', 'Goto implementations' }
lvim.lsp.buffer_mappings.normal_mode['gI'] = { '<cmd>Telescope lsp_incoming_calls<cr>', 'Goto incoming calls' }
lvim.lsp.buffer_mappings.normal_mode['gO'] = { '<cmd>Telescope lsp_outgoing_calls<cr>', 'Goto outgoing calls' }
lvim.lsp.buffer_mappings.normal_mode['gr'] = { '<cmd>Telescope lsp_references<cr>', 'Goto references' }
lvim.lsp.buffer_mappings.normal_mode['gD'] = nil

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

lvim.builtin.which_key.mappings['b']['a'] = {
  '<cmd>:enew<cr>',
  'New Buffer',
}
lvim.builtin.which_key.mappings['b']['c'] = {
  '<cmd>BufferKill<cr>',
  'Kill Buffer',
}
lvim.builtin.which_key.mappings['b']['d'] = {
  '<cmd>:%d<cr>',
  'Clear Buffer',
}
lvim.builtin.which_key.mappings['b']['y'] = {
  '<cmd>:%y<cr>',
  'Copy Buffer',
}
lvim.builtin.which_key.mappings['b']['A'] = {
  '<cmd>:%bd<cr>',
  'Close All Buffer',
}
lvim.builtin.which_key.mappings['b']['x'] = {
  '<cmd>:%bd|e#|bd#<cr>',
  'Close Others Buffer',
}

lvim.builtin.which_key.mappings['c'] = nil

lvim.builtin.which_key.mappings['g']['d'] = {
  '<cmd>DiffviewOpen<cr>',
  'Git Diff',
}

lvim.builtin.which_key.mappings['h'] = {
  '<cmd>DogeGenerate<cr>',
  'DogeGenerate',
}

lvim.builtin.which_key.mappings['l']['o'] = {
  '<cmd>SymbolsOutline<cr>',
  'SymbolsOutline',
}

lvim.builtin.which_key.mappings['s']['R'] = {
  '<cmd>Spectre<cr>',
  'Search and Replace',
}
lvim.builtin.which_key.mappings['s']['d'] = {
  '<cmd>Telescope grep_string<cr>',
  'Search word under cursor',
}

lvim.builtin.which_key.mappings['t'] = {
  name = 'Telescope',
  t = {
    '<cmd>Telescope<cr>',
    'Toggle',
  },
  r = {
    '<cmd>Telescope resume<cr>',
    'Resume',
  },
  p = {
    '<cmd>Telescope projects<cr>',
    'Projects',
  },
}

lvim.builtin.which_key.mappings['w'] = nil

lvim.builtin.which_key.mappings['T'] = {
  '<cmd>ToggleTerm<cr>',
  'Toggle Term',
}

vim.api.nvim_set_keymap('n', '<m-d>', '<cmd>RustOpenExternalDocs<Cr>', { noremap = true, silent = true })

lvim.builtin.which_key.mappings['C'] = {
  name = 'Rust',
  r = { '<cmd>RustRunnables<Cr>', 'Runnables' },
  t = { '<cmd>lua _CARGO_TEST()<cr>', 'Cargo Test' },
  m = { '<cmd>RustExpandMacro<Cr>', 'Expand Macro' },
  c = { '<cmd>RustOpenCargo<Cr>', 'Open Cargo' },
  p = { '<cmd>RustParentModule<Cr>', 'Parent Module' },
  d = { '<cmd>RustDebuggables<Cr>', 'Debuggables' },
  v = { '<cmd>RustViewCrateGraph<Cr>', 'View Crate Graph' },
  R = {
    '<cmd>lua require("rust-tools/workspace_refresh")._reload_workspace_from_cargo_toml()<Cr>',
    'Reload Workspace',
  },
  o = { '<cmd>RustOpenExternalDocs<Cr>', 'Open External Docs' },
  y = { '<cmd>lua require"crates".open_repository()<cr>', '[crates] open repository' },
  P = { '<cmd>lua require"crates".show_popup()<cr>', '[crates] show popup' },
  i = { '<cmd>lua require"crates".show_crate_popup()<cr>', '[crates] show info' },
  f = { '<cmd>lua require"crates".show_features_popup()<cr>', '[crates] show features' },
  D = { '<cmd>lua require"crates".show_dependencies_popup()<cr>', '[crates] show dependencies' },
}
