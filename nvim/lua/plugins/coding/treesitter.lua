return {
  "nvim-treesitter/nvim-treesitter",
  build = ":TSUpdate",
  opts = {
    ensure_installed = { "bash", "c", "diff", "html", "javascript", "jsdoc", "json", "jsonc", "lua", "luadoc", "markdown", "markdown_inline", "python", "query", "regex", "toml", "tsx", "typescript", "vim", "vimdoc", "xml", "yaml" },
    indent = { enable = true },
    textobjects = {
      move = {
        enable = true,
        goto_next_start = { ["]f"] = "@function.outer", ["]c"] = "@class.outer", ["]a"] = "@parameter.inner" },
        goto_next_end = { ["]F"] = "@function.outer", ["]C"] = "@class.outer", ["]A"] = "@parameter.inner" },
        goto_previous_start = { ["[f"] = "@function.outer", ["[c"] = "@class.outer", ["[a"] = "@parameter.inner" },
        goto_previous_end = { ["[F"] = "@function.outer", ["[C"] = "@class.outer", ["[A"] = "@parameter.inner" },
      },
    },
    highlight = {
      enable = true,
      additional_vim_regex_highlighting = false,
      disable = function(_, bufnr)
        local max_filesize = 1000 * 1024
        local max_line_count = 100 * 1000
        local max_filesize_perline = 1024
        local ok, stats = pcall(vim.uv.fs_stat, vim.api.nvim_buf_get_name(bufnr))
        if ok and stats then
          local line_count = vim.api.nvim_buf_line_count(bufnr)
          if
            stats.size > max_filesize
            or line_count > max_line_count
            or stats.size / line_count > max_filesize_perline
          then
            return true
          end
        end
      end,
    },
  },
  config = function(_, opts)
    require("nvim-treesitter.configs").setup(opts)
  end,
}
