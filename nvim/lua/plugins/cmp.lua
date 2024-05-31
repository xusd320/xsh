return {
  {
    "nvim-cmp",
    dependencies = {
      "f3fora/cmp-spell",
    },
    opts = function(_, opts)
      local cmp = require("cmp")
      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
      })
      table.insert(opts.sources, {
        name = "spell",
        option = {
          keep_all_entries = false,
          enable_in_context = function()
            return false
          end,
        },
      })
    end,
  },
}
