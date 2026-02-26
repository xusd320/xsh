return {
  "saghen/blink.pairs",
  version = "*",
  event = "InsertEnter",
  dependencies = "saghen/blink.download",
  opts = {
    mappings = {
      enabled = true,
      cmdline = true,
    },
    highlights = {
      enabled = true,
      cmdline = true,
      groups = {
        "BlinkPairsOrange",
        "BlinkPairsPurple",
        "BlinkPairsBlue",
      },
      unmatched_group = "BlinkPairsUnmatched",
      matchparen = {
        enabled = true,
        cmdline = false,
        include_surrounding = false,
        group = "BlinkPairsMatchParen",
        priority = 250,
      },
    },
  },
  init = function()
    -- requires require('vim._extui').enable({}), otherwise has no effect
    if vim.fn.has("nvim-0.11") == 1 or pcall(require, "vim._extui") then
      pcall(function() require("vim._extui").enable({}) end)
    end
  end,
}
