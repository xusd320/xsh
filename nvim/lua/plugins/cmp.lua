return {
  {
    "nvim-cmp",
    dependencies = {
      "f3fora/cmp-spell",
    },
    opts = function(_, opts)
      local cmp = require("cmp")
      local compare = require("cmp.config.compare")
      opts.mapping = vim.tbl_extend("force", opts.mapping, {
        ["<Tab>"] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ["<S-Tab>"] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
      })
      vim.tbl_extend("force", opts.sorting, {
        comparators = {
          compare.kind,
          compare.offset,
          compare.exact,
          compare.score,
          compare.locality,
          -- compare.recently_used,
          -- compare.length,
          -- compare.order,
          -- compare.scopes,
          -- compare.sort_text,
        },
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
