return {
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        position = "right",
      },
      filesystem = {
        bind_to_cwd = false,
        follow_current_file = { enabled = true },
        use_libuv_file_watcher = true,
      },
      sources = { "filesystem", "buffers", "git_status" },
      default_component_configs = {
        git_status = {
          symbols = {
            staged = "⊕",
            deleted = "⊖",
            conflict = "",
            modified = "◍",
            renamed = "»",
            untracked = "?",
            added = "+",
            ignored = "",
            unstaged = "⊖",
          },
        },
        file_size = {
          enabled = false,
        },
      },
    },
  },
}
