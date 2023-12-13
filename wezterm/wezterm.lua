require("startup-fullscreen")
require("format-tab-title")

local wezterm = require("wezterm")

local config = wezterm.config_builder()

config.color_scheme = "Catppuccin Mocha"

config.font = wezterm.font_with_fallback({ "Hack Nerd Font" })

config.font_size = 14.0

config.freetype_load_target = "Light"

config.freetype_render_target = "HorizontalLcd"

config.cell_width = 0.9

config.front_end = "OpenGL"

config.window_padding = {
  left = 0,
  right = 0,
  top = 0,
  bottom = 0,
}

config.disable_default_key_bindings = true

config.leader = { key = "a", mods = "CTRL" }

config.keys = {
  { key = "a", mods = "LEADER|CTRL", action = wezterm.action({ SendString = "\x01" }) },
  { key = "-", mods = "LEADER", action = wezterm.action({ SplitVertical = { domain = "CurrentPaneDomain" } }) },
  { key = "\\", mods = "LEADER", action = wezterm.action({ SplitHorizontal = { domain = "CurrentPaneDomain" } }) },
  { key = "z", mods = "LEADER", action = "TogglePaneZoomState" },
  { key = "c", mods = "LEADER", action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }) },
  { key = "h", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Left" }) },
  { key = "j", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Down" }) },
  { key = "k", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Up" }) },
  { key = "l", mods = "LEADER", action = wezterm.action({ ActivatePaneDirection = "Right" }) },
  { key = "H", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Left", 5 } }) },
  { key = "J", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Down", 5 } }) },
  { key = "K", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Up", 5 } }) },
  { key = "L", mods = "LEADER|SHIFT", action = wezterm.action({ AdjustPaneSize = { "Right", 5 } }) },
  { key = "1", mods = "LEADER", action = wezterm.action({ ActivateTab = 0 }) },
  { key = "2", mods = "LEADER", action = wezterm.action({ ActivateTab = 1 }) },
  { key = "3", mods = "LEADER", action = wezterm.action({ ActivateTab = 2 }) },
  { key = "4", mods = "LEADER", action = wezterm.action({ ActivateTab = 3 }) },
  { key = "5", mods = "LEADER", action = wezterm.action({ ActivateTab = 4 }) },
  { key = "6", mods = "LEADER", action = wezterm.action({ ActivateTab = 5 }) },
  { key = "7", mods = "LEADER", action = wezterm.action({ ActivateTab = 6 }) },
  { key = "8", mods = "LEADER", action = wezterm.action({ ActivateTab = 7 }) },
  { key = "9", mods = "LEADER", action = wezterm.action({ ActivateTab = 8 }) },
  { key = "x", mods = "LEADER", action = wezterm.action({ CloseCurrentPane = { confirm = false } }) },
  { key = "f", mods = "CMD", action = wezterm.action({ Search = { CaseSensitiveString = "" } }) },
  { key = "h", mods = "CMD", action = wezterm.action({ HideApplication }) },
  { key = "k", mods = "CMD", action = wezterm.action({ ClearScrollback = "ScrollbackOnly" }) },
  { key = "t", mods = "CMD", action = wezterm.action({ SpawnTab = "CurrentPaneDomain" }) },
  { key = "T", mods = "CMD|SHIFT", action = wezterm.action({ SpawnTab = "DefaultDomain" }) },
  { key = "v", mods = "CMD", action = wezterm.action({ PasteFrom = "Clipboard" }) },
  { key = "w", mods = "CMD", action = wezterm.action({ CloseCurrentTab = { confirm = false } }) },
  { key = "+", mods = "CMD", action = wezterm.action({ IncreaseFontSize }) },
  { key = "-", mods = "CMD", action = wezterm.action({ DecreaseFontSize }) },
}

config.window_decorations = "RESIZE"

config.native_macos_fullscreen_mode = true

return config
