return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        position = "right",
      },
      filesystem = {
        bind_to_cwd = false,
        follow_current_file = { enabled = false },
        use_libuv_file_watcher = true,
      },
      sources = { "filesystem", "buffers", "git_status" },
      default_component_configs = {
        git_status = {
          symbols = {
            added = "",
            deleted = "",
            modified = "",
            renamed = "➜",
            untracked = "★",
            ignored = "◌",
            unstaged = "✗",
            staged = "✓",
            conflict = "",
          },
        },
        file_size = {
          enabled = false,
        },
      },
    },
  },
}
