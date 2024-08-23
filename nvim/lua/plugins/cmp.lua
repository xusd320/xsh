return {
  {
    "nvim-cmp",
    dependencies = {
      "uga-rosa/cmp-dictionary",
      config = function()
        require("cmp_dictionary").setup({
          paths = { "/usr/share/dict/words" },
          exact_length = 2,
        })
      end,
    },
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
      })

      table.insert(opts.sources or {}, {
        name = "dictionary",
        keyword_length = 2,
      })
    end,
  },
}
