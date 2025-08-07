require("startup-fullscreen")
require("format-tab-title")

local wezterm = require("wezterm")

local config = wezterm.config_builder()

local opacity = 1

local transparent_bg = "rgba(22, 24, 26, " .. opacity .. ")"

config.native_macos_fullscreen_mode = true

config.window_padding = {
  left = 1,
  right = 1,
  top = 1,
  bottom = 1,
}

config.max_fps = 120

-- config.color_scheme = "catppuccin-mocha"

config.colors = require("cyberdream")

config.colors.tab_bar = {
  background = config.window_background_image and "rgba(0, 0, 0, 0)" or transparent_bg,
  new_tab = { fg_color = config.colors.background, bg_color = config.colors.brights[6] },
  new_tab_hover = { fg_color = config.colors.background, bg_color = config.colors.foreground },
}

config.force_reverse_video_cursor = true

config.window_decorations = "RESIZE"

config.window_background_opacity = opacity

config.window_background_image = (os.getenv("WEZTERM_CONFIG_FILE") or ""):gsub("wezterm.lua", "bg-blurred.png")

config.font_size = 14.0

config.font = wezterm.font("JetBrains Mono")

config.freetype_load_target = "Light"

config.freetype_render_target = "HorizontalLcd"

config.cell_width = 0.86

config.front_end = "OpenGL"

config.scrollback_lines = 100000

config.keys = {
  { key = "k", mods = "SUPER", action = wezterm.action({ ClearScrollback = "ScrollbackAndViewport" }) },
  { key = "|", mods = "SUPER", action = wezterm.action.SplitHorizontal({ domain = "CurrentPaneDomain" }) },
  { key = "-", mods = "SUPER|SHIFT", action = wezterm.action.SplitVertical({ domain = "CurrentPaneDomain" }) },
  { key = "Backspace", mods = "SUPER|SHIFT", action = wezterm.action.CloseCurrentPane({ confirm = false }) },
  { key = "Tab", mods = "CTRL", action = wezterm.action.DisableDefaultAssignment },
  { key = "Tab", mods = "SHIFT|CTRL", action = wezterm.action.DisableDefaultAssignment },
}

return config
