lvim.builtin.telescope.defaults.layout_strategy = "horizontal"
lvim.builtin.telescope.defaults.layout_config.horizontal.width = 0.9
lvim.builtin.telescope.defaults.layout_config.horizontal.height = 0.9
lvim.builtin.telescope.defaults.layout_config.horizontal.preview_cutoff = 120
lvim.builtin.telescope.defaults.layout_config.horizontal.prompt_position = "bottom"
for b, _ in pairs(lvim.builtin.telescope.pickers) do
  lvim.builtin.telescope.pickers[b].theme = nil
  lvim.builtin.telescope.pickers[b].show_line = false
end
lvim.builtin.telescope.pickers.diagnostics = {
  line_width = 0
}