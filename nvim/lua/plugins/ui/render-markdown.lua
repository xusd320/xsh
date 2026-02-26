return {
  "MeanderingProgrammer/render-markdown.nvim",
  dependencies = { "nvim-treesitter/nvim-treesitter", "nvim-tree/nvim-web-devicons" },
  event = "VeryLazy",
  opts = {
    file_types = { "markdown", "codecompanion" },
    render_modes = { "n", "c", "i", "v", "V" },
  },
}
