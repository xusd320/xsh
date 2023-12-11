require("startup-fullscreen")
require("format-tab-title")

local wezterm = require("wezterm")

local wezconf = wezterm.config_builder()

wezconf.font = wezterm.font("Hack Nerd Font")

wezconf.font_size = 14.0

wezconf.color_scheme = "Catppuccin Mocha"

wezconf.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

wezconf.window_decorations = "RESIZE"

wezconf.native_macos_fullscreen_mode = true

return wezconf
