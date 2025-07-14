return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  {
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
  },
}
