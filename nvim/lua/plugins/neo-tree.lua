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
        filtered_items = {
          respect_gitignore = true,
          gitignore_source = "git check-ignore",
        },
      },
      sources = { "filesystem", "buffers", "git_status" },
      enable_git_status = true,
      git_status_async = true,
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
        type = {
          enabled = false,
        },
        last_modified = {
          enabled = false,
        },
        created = {
          enabled = false,
        },
        symlink_target = {
          enabled = false,
        },
      },
    },
  },
}
