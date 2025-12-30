return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  opts = {
    integrations = {
      aerial = true,
      blink_cmp = true,
      dashboard = true,
      flash = true,
      fidget = true,
      illuminate = true,
      indent_blankline = { enabled = true },
      lsp_trouble = true,
      mason = true,
      markdown = true,
      native_lsp = {
        enabled = true,
        underlines = {
          errors = { "undercurl" },
          hints = { "undercurl" },
          warnings = { "underline" },
          information = { "undercurl" },
        },
      },
      neotree = true,
      semantic_tokens = true,
      telescope = true,
      treesitter = true,
      which_key = true,
    },
    custom_highlights = function(colors)
      local u = require("catppuccin.utils.colors")
      return {
        CursorLineNr = { bg = u.blend(colors.overlay0, colors.base, 0.10), style = { "bold" } },
        CursorLine = { bg = u.blend(colors.overlay0, colors.base, 0.06) },
        LspReferenceText = { bg = colors.surface2 },
        LspReferenceWrite = { bg = colors.surface2 },
        LspReferenceRead = { bg = colors.surface2 },
        DiagnosticUnderlineWarn = { sp = colors.peach, style = { "underline" } },
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
