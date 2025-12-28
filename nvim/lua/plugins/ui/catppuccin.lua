return {
  "catppuccin/nvim",
  name = "catppuccin",
  opts = {
    custom_highlights = function(colors)
      local u = require("catppuccin.utils.colors")
      return {
        CursorLineNr = { bg = u.blend(colors.overlay0, colors.base, 0.10), style = { "bold" } },
        CursorLine = { bg = u.blend(colors.overlay0, colors.base, 0.06) },
        LspReferenceText = { bg = colors.surface2 },
        LspReferenceWrite = { bg = colors.surface2 },
        LspReferenceRead = { bg = colors.surface2 },
      }
    end,
    flavour = "mocha",
    float = {
      transparent = true,
    },
    transparent_background = true,
    term_colors = true,
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme("catppuccin")
  end,
}
