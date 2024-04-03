require("startup-fullscreen")
require("format-tab-title")

local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.window_decorations = "RESIZE"

config.native_macos_fullscreen_mode = true

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

config.color_scheme = "Catppuccin Mocha"

config.font_size = 13.0

config.font = wezterm.font("Hack Nerd Font")

config.freetype_load_target = "Light"

config.freetype_render_target = "HorizontalLcd"

config.cell_width = 0.9

config.front_end = "OpenGL"

config.scrollback_lines = 10000

return config
