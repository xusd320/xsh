local leet_arg = "leetcode.nvim"

return {
  {
    "kawre/leetcode.nvim",
    lazy = leet_arg ~= vim.fn.argv(0, -1),
    cmd = "Leet",
    dependencies = {
      "nvim-telescope/telescope.nvim",
      "nvim-lua/plenary.nvim",
      "MunifTanjim/nui.nvim",
    },
    opts = {
      arg = leet_arg,
      lang = "rust",
      cn = {
        enabled = true,
        translator = true,
        translate_problems = true,
      },
    },
  },
}
