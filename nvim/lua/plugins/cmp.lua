return {
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "f3fora/cmp-spell",
      },
    },
    opts = function(_, opts)
      table.insert(opts.sources, {
        name = "spell",
        option = {
          keep_all_entries = false,
          enable_in_context = function()
            return true
          end,
        },
      })
    end,
  },
}