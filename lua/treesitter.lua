lvim.builtin.treesitter.ensure_installed = {
  "rust",
  "c",
  "cpp",
  "typescript",
  "javascript",
  "tsx",
  "python",
  "bash",
  "vim",
  "lua",
  "html",
  "css",
  "toml",
  "json",
  "yaml",
  "cmake",
  "markdown",
  "vimdoc",
}
lvim.builtin.treesitter.rainbow.enable = true
lvim.builtin.treesitter.textobjects = {
  select = {
    enable = true,
    lookahead = true,
    keymaps = {
      ["af"] = "@function.outer",
      ["if"] = "@function.inner",
      ["ac"] = "@class.outer",
      ["ic"] = "@class.inner",
      ["ab"] = "@block.outer",
      ["ib"] = "@block.inner",
      ["ad"] = "@conditional.outer",
      ["id"] = "@conditional.inner",
      ["al"] = "@loop.outer",
      ["il"] = "@loop.inner",
      ["ap"] = "@parameter.outer",
      ["ip"] = "@parameter.inner",
      ["am"] = "@call.outer",
      ["im"] = "@call.inner",
      ["ag"] = "@comment.outer",
      ["ar"] = "@frame.outer",
      ["ir"] = "@frame.inner",
      ["at"] = "@attribute.outer",
      ["it"] = "@attribute.inner",
      ["ae"] = "@scopename.inner",
      ["ie"] = "@scopename.inner",
      ["as"] = "@statement.outer",
      ["is"] = "@statement.outer",
    },
    include_surrounding_whitespace = false,
  },
  swap = {
    enable = false,
  },
  move = {
    enable = false,
  },
  auto_tag = {
    enable = true
  }
}
lvim.builtin.treesitter.textsubjects.enable = true