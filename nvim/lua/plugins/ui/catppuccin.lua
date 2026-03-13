return {
  "catppuccin/nvim",
  name = "catppuccin",
  lazy = false,
  priority = 1000,
  opts = {
    integrations = {
      aerial = true,
      blink_cmp = true,
      blink_pairs = true,
      bufferline = true,
      dap = true,
      dap_ui = true,
      dashboard = true,
      diffview = true,
      fidget = true,
      flash = true,
      gitsigns = true,
      grug_far = true,
      illuminate = true,
      indent_blankline = { enabled = true },
      lsp_trouble = true,
      mason = true,
      markdown = true,
      mini = {
        enabled = true,
        indents = true,
      },
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
      render_markdown = true,
      semantic_tokens = true,
      telescope = true,
      todo_comments = true,
      treesitter = true,
      treesitter_context = true,
      ufo = true,
      which_key = true,
    },
    styles = {
      comments = { "italic" },
      conditionals = { "italic" },
      loops = { "bold" },
      functions = { "bold" },
      keywords = { "italic" },
      strings = {},
      variables = {},
      numbers = {},
      booleans = { "bold" },
      properties = {},
      types = {},
      operators = {},
    },
    dim_inactive = {
      enabled = true,
      shade = "dark",
      percentage = 0.15,
    },
    custom_highlights = function(colors)
      return {
        CursorLineNr = { fg = colors.lavender, style = { "bold" } },

        -- Floating windows
        FloatBorder = { fg = colors.blue, bg = colors.mantle },
        NormalFloat = { bg = colors.mantle },
        
        -- Telescope
        TelescopeBorder = { fg = colors.surface2, bg = colors.none },
        TelescopeNormal = { bg = colors.none },
        TelescopePromptBorder = { fg = colors.surface2, bg = colors.none },
        TelescopeResultsBorder = { fg = colors.surface2, bg = colors.none },
        TelescopePreviewBorder = { fg = colors.surface2, bg = colors.none },

        -- Bufferline Separators
        BufferLineSeparator = { fg = colors.surface1 },
        BufferLineSeparatorSelected = { fg = colors.surface1 },
        BufferLineSeparatorVisible = { fg = colors.surface1 },
      }
    end,
    flavour = "mocha",
    term_colors = true,
  },
  config = function(_, opts)
    require("catppuccin").setup(opts)
    vim.cmd.colorscheme("catppuccin-mocha")
  end,
}
