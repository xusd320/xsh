return {
  {
    "luukvbaal/statuscol.nvim",
    event = { "BufRead", "BufNewFile" },
    opts = function()
      local builtin = require("statuscol.builtin")
      return {
        ft_ignore = { "neo-tree", "neo-tree-popup", "alpha", "lazy", "mason" },
        segments = {
          { text = { builtin.lnumfunc }, click = "v:lua.ScLa" },
          {
            sign = { name = { "Diagnostic*" }, text = { ".*" }, maxwidth = 1, colwidth = 1, auto = true },
            click = "v:lua.ScSa",
          },
        },
      }
    end,
    init = function() end,
    config = function(_, opts)
      require("statuscol").setup(opts)
    end,
  },
}
