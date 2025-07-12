return {
  {
    "nvim-treesitter/nvim-treesitter",
    opts = {
      highlight = {
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
  },
}
