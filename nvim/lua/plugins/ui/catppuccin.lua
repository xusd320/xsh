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
      notify = true,
      semantic_tokens = true,
      telescope = true,
      treesitter = true,
      which_key = true,
    },
    custom_highlights = function(colors)
      return {
        CursorLineNr = { fg = colors.lavender, style = { "bold" } },
        NavicIconsFile = { fg = colors.blue },
        NavicIconsModule = { fg = colors.yellow },
        NavicIconsNamespace = { fg = colors.yellow },
        NavicIconsPackage = { fg = colors.yellow },
        NavicIconsClass = { fg = colors.yellow },
        NavicIconsMethod = { fg = colors.blue },
        NavicIconsProperty = { fg = colors.green },
        NavicIconsField = { fg = colors.green },
        NavicIconsConstructor = { fg = colors.orange },
        NavicIconsEnum = { fg = colors.yellow },
        NavicIconsInterface = { fg = colors.yellow },
        NavicIconsFunction = { fg = colors.blue },
        NavicIconsVariable = { fg = colors.magenta },
        NavicIconsConstant = { fg = colors.magenta },
        NavicIconsString = { fg = colors.green },
        NavicIconsNumber = { fg = colors.orange },
        NavicIconsBoolean = { fg = colors.orange },
        NavicIconsArray = { fg = colors.yellow },
        NavicIconsObject = { fg = colors.yellow },
        NavicIconsKey = { fg = colors.magenta },
        NavicIconsNull = { fg = colors.orange },
        NavicIconsEnumMember = { fg = colors.yellow },
        NavicIconsStruct = { fg = colors.yellow },
        NavicIconsEvent = { fg = colors.yellow },
        NavicIconsOperator = { fg = colors.sky },
        NavicIconsTypeParameter = { fg = colors.yellow },
        NavicText = { fg = colors.text },
        NavicSeparator = { fg = colors.text },

        -- Floating windows
        FloatBorder = { fg = colors.surface2, bg = colors.none },
        NormalFloat = { bg = colors.none },
        
        -- Telescope
        TelescopeBorder = { fg = colors.surface2, bg = colors.none },
        TelescopeNormal = { bg = colors.none },
        TelescopePromptBorder = { fg = colors.surface2, bg = colors.none },
        TelescopeResultsBorder = { fg = colors.surface2, bg = colors.none },
        TelescopePreviewBorder = { fg = colors.surface2, bg = colors.none },
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
