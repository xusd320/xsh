require("startup-fullscreen")
require("format-tab-title")

local wezterm = require("wezterm")

local rose_pine_theme = require("./rose-pine/plugin/").moon

local config = wezterm.config_builder()

config.window_decorations = "RESIZE"

config.native_macos_fullscreen_mode = true

config.window_padding = {
  left = 1,
  right = 1,
  top = 1,
  bottom = 1,
}

config.window_frame = rose_pine_theme.window_frame()

config.window_frame.font_size = 14.0

config.colors = rose_pine_theme.colors()

config.font_size = 14.0

config.freetype_load_target = "Light"

config.freetype_render_target = "HorizontalLcd"

config.cell_width = 0.86

config.front_end = "OpenGL"

config.scrollback_lines = 100000

config.keys = {
  { key = "k", mods = "SUPER", action = wezterm.action({ ClearScrollback = "ScrollbackAndViewport" }) },
  { key = "Tab", mods = "CTRL", action = wezterm.action.DisableDefaultAssignment },
  { key = "Tab", mods = "SHIFT|CTRL", action = wezterm.action.DisableDefaultAssignment },
}

return config
