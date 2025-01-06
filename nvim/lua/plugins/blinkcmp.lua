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
            exact_length = 4,
            max_number_items = 10,
          })
        end,
      },
    },
    opts = {
      completion = {
        list = {
          selection = "auto_insert",
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
        default = {
          "dictionary",
        },
        providers = {
          dictionary = {
            name = "dictionary",
            module = "blink.compat.source",
            opts = {
              keyword_length = 4,
            },
          },
        },
      },
      fuzzy = {
        sorts = {
          "kind",
          "score",
          function(a, b)
            local sort = require("blink.cmp.fuzzy.sort")
            if a.source_id == "dictionary" and b.source_id == "dictionary" then
              return sort.label(a, b)
            end
          end,
          "label",
        },
      },
    },
  },
}
