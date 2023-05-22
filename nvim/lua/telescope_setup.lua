lvim.builtin.telescope.defaults.layout_strategy = 'horizontal'
lvim.builtin.telescope.defaults.layout_config.horizontal = {
  width = 0.9,
  height = 0.9,
  preview_cutoff = 120,
  prompt_position = 'bottom'
}
lvim.builtin.telescope.defaults.path_display = function(opts, path)
  local home = require('plenary.path').path.home;
  local cwd = vim.fn.getcwd()
  local tail = require('telescope.utils').path_tail(path)
  local shorten_path = string.gsub(path, string.gsub(cwd, '%-', '%%-'), '.')
  return string.gsub(shorten_path, home, '~')
end

for b, _ in pairs(lvim.builtin.telescope.pickers) do
  lvim.builtin.telescope.pickers[b].theme = nil
  lvim.builtin.telescope.pickers[b].show_line = false
end
lvim.builtin.telescope.pickers.lsp_definitions = {
  show_line = false
}
lvim.builtin.telescope.pickers.lsp_references = {
  show_line = false
}
lvim.builtin.telescope.pickers.lsp_implementations = {
  show_line = false
}
lvim.builtin.telescope.pickers.lsp_type_definitions = {
  show_line = false
}
lvim.builtin.telescope.pickers.lsp_incoming_calls = {
  show_line = false
}
lvim.builtin.telescope.pickers.lsp_outgoing_calls = {
  show_line = false
}
lvim.builtin.telescope.pickers.diagnostics = {
  line_width = 0
}