local wezterm = require("wezterm")

local function get_current_working_dir(tab)
  local current_dir = tostring(tab.active_pane.current_working_dir) or ""
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
  local background = config.colors.background
  local foreground = config.colors.foreground

  local has_unseen_output = false
  if not tab.is_active then
    for _, pane in ipairs(tab.panes) do
      if pane.has_unseen_output then
        has_unseen_output = true
        break
      end
    end
  end

  if has_unseen_output then
    foreground = config.colors.brights[1]
  elseif tab.is_active then
    foreground = config.colors.brights[2]
  elseif hover then
    foreground = config.colors.brights[3]
  end

  local cwd = wezterm.format({
    { Attribute = { Italic = true } },
    { Background = { Color = background } },
    { Foreground = { Color = foreground } },
    { Text = get_current_working_dir(tab) },
  })

  local title = string.format("%s. %s ~ %s ", tab.tab_index + 1, get_process(tab), cwd)

  return {
    { Background = { Color = background } },
    { Foreground = { Color = foreground } },
    { Text = title },
  }
end)
