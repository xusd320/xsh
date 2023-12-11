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

local function get_current_working_dir(tab)
  local current_dir = tab.active_pane.current_working_dir or ""
  return string.gsub(current_dir, "(.*[/\\])(.*)", "%2")
end

local function get_process(tab)
  if not tab.active_pane or tab.active_pane.foreground_process_name == "" then
    return "[?]"
  end

  local process_name = string.gsub(tab.active_pane.foreground_process_name, "(.*[/\\])(.*)", "%2")

  return string.format("%s", process_name)
end

wezterm.on("format-tab-title", function(tab, tabs, panes, config, hover, max_width)
  local has_unseen_output = false
  if not tab.is_active then
    for _, pane in ipairs(tab.panes) do
      if pane.has_unseen_output then
        has_unseen_output = true
        break
      end
    end
  end

  local cwd = wezterm.format({
    { Attribute = { Italic = true } },
    { Text = get_current_working_dir(tab) },
  })

  local title = string.format(" %s ~ %s ", get_process(tab), cwd)

  if has_unseen_output then
    return {
      { Foreground = { Color = "#28719c" } },
      { Text = title },
    }
  end

  return {
    { Text = title },
  }
end)

return wezconf
