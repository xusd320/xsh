return {
  "nvim-neo-tree/neo-tree.nvim",
  branch = "v3.x",
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-tree/nvim-web-devicons",
    "MunifTanjim/nui.nvim",
  },
  enabled = true,
  keys = {
    {
      "<leader>e",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
      end,
      desc = "Explorer NeoTree (Root Dir)",
    },
    {
      "<leader>E",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
      end,
      desc = "Explorer NeoTree (cwd)",
    },
    {
      "<leader>fe",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
      end,
      desc = "Explorer NeoTree (Root Dir)",
    },
    {
      "<leader>fE",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = vim.loop.cwd() })
      end,
      desc = "Explorer NeoTree (cwd)",
    },
    {
      "<D-e>",
      function()
        require("neo-tree.command").execute({ toggle = true, dir = vim.uv.cwd() })
      end,
      desc = "Explorer NeoTree (Root Dir)",
    },
  },
  opts = {
    window = {
      position = "left",
      mappings = {
        Y = "copy_selector",
      },
    },
    filesystem = {
      bind_to_cwd = false,
      follow_current_file = { enabled = true },
      use_libuv_file_watcher = true,
      filtered_items = {
        hide_dotfiles = false,
        hide_gitignored = true,
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
    commands = {
      copy_selector = function(state)
        local node = state.tree:get_node()
        local filepath = node:get_id()
        local filename = node.name
        local modify = vim.fn.fnamemodify

        local vals = {
          ["FILENAME"] = { priority = 6, val = filename },
          ["PATH (CWD)"] = { priority = 5, val = modify(filepath, ":.") },
          ["BASENAME"] = { priority = 4, val = modify(filename, ":r") },
          ["EXTENSION"] = { priority = 3, val = modify(filename, ":e") },
          ["PATH"] = { priority = 2, val = filepath },
          ["PATH (HOME)"] = { priority = 1, val = modify(filepath, ":~") },
          ["URI"] = { priority = 0, val = vim.uri_from_fname(filepath) },
        }

        local options = vim.tbl_filter(function(val)
          return vals[val].val ~= ""
        end, vim.tbl_keys(vals))

        if vim.tbl_isempty(options) then
          return
        end

        table.sort(options, function(a, b)
          return vals[a].priority > vals[b].priority
        end)

        vim.ui.select(options, {
          prompt = "Choose to copy to clipboard:",
          format_item = function(item)
            return ("%s: %s"):format(item, vals[item].val)
          end,
        }, function(choice)
          local result = vals[choice]
          if result then
            vim.fn.setreg("+", result.val)
          end
        end)
      end,
    },
  },
}
