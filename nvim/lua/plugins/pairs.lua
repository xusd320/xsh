return {
  {
    "echasnovski/mini.pairs",
    enabled = false,
  },
  {
    "windwp/nvim-autopairs",
    event = "VeryLazy",
    config = function(_, opts)
      local cmp_autopairs = require("nvim-autopairs.completion.cmp")
      local cmp = require("cmp")
      cmp.event:on("confirm_done", cmp_autopairs.on_confirm_done())
      require("nvim-autopairs").setup({  
        enable_check_bracket_line = false
      })
    end,
    keys = {
      {
        "<leader>up",
        function()
          local Util = require("lazy.core.util")
          require("nvim-autopairs").state.disabled = not require("nvim-autopairs").state.disabled
          if require("nvim-autopairs").state.disabled then
            Util.warn("Disabled auto pairs", { title = "Option" })
          else
            Util.info("Enabled auto pairs", { title = "Option" })
          end
        end,
        desc = "Toggle auto pairs",
      },
    },
  },
}
