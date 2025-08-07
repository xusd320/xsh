return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "cyberdream",
    },
  },
  {
    "catppuccin/nvim",
    name = "catppuccin",
    lazy = true,
    opts = {
      transparent_background = true,
      flavour = "mocha",
      term_colors = true,
      dim_inactive = {
        enabled = true,
        percentage = 0.06,
      },
    },
  },
  {
    "scottmckendry/cyberdream.nvim",
    lazy = false,
    config = function()
      require("cyberdream").setup({
        variant = "auto",
        transparent = true,
        italic_comments = true,
        hide_fillchars = true,
        terminal_colors = true,
        cache = false,
        borderless_pickers = false,
      })
    end,
  },
}
