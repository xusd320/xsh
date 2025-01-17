return {
  {
    "saghen/blink.cmp",
    dependencies = {
      {
        "uga-rosa/cmp-dictionary",
        dependencies = {
          "saghen/blink.compat",
        },
        config = function()
          require("cmp_dictionary").setup({
            paths = { "/usr/share/dict/words" },
          })
        end,
      },
    },
    opts = {
      completion = {
        list = {
          selection = {
            preselect = false,
            auto_insert = true,
          },
        },
        documentation = { auto_show = true },
      },
      keymap = {
        preset = "enter",
        ["<Tab>"] = { "select_next", "fallback" },
        ["<S-Tab>"] = { "select_prev", "fallback" },
      },
      signature = { enabled = true },
      sources = {
        compat = {
          "dictionary",
        },
        providers = {
          dictionary = {
            score_offset = -100,
            min_keyword_length = 2,
          },
        },
      },
    },
  },
}
