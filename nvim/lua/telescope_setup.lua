lvim.builtin.telescope.defaults.layout_strategy = "horizontal"
lvim.builtin.telescope.defaults.layout_config.horizontal = {
  width = 0.9,
  height = 0.9,
  preview_cutoff = 120,
  prompt_position = "bottom"
}
lvim.builtin.telescope.defaults.path_display = { "truncate" }
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
lvim.builtin.telescope.pickers.diagnostics = {
  line_width = 0
}