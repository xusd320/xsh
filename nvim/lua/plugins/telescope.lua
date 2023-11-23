return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "ahmedkhalf/project.nvim",
        opts = {
          manual_mode = false,
        },
        event = "VeryLazy",
        config = function(_, opts)
          require("project_nvim").setup(opts)
          require("lazyvim.util").on_load("telescope.nvim", function()
            require("telescope").load_extension("projects")
          end)
        end,
        keys = {
          { "<leader>fp", "<Cmd>Telescope projects<CR>", desc = "Projects" },
        },
      },
      {
        "nvim-telescope/telescope-live-grep-args.nvim",
        version = "^1.0.0",
        event = "VeryLazy",
        config = function(_, opts)
          require("lazyvim.util").on_load("telescope.nvim", function()
            require("telescope").load_extension("live_grep_args")
          end)
        end,
        keys = {
          {
            "<leader>sx",
            function()
              require("telescope").extensions.live_grep_args.live_grep_args()
            end,
            desc = "Grep with args",
          },
        },
      },
    },
    opts = {
      defaults = {
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            width = 0.9,
            height = 0.9,
            preview_cutoff = 120,
            prompt_position = "bottom",
          },
        },
        path_display = function(opts, path)
          local home = require("plenary.path").path.home
          local cwd = vim.fn.getcwd()
          local shorten_path = string.gsub(path, string.gsub(cwd, "%-", "%%-"), ".")
          return string.gsub(shorten_path, home, "~")
        end,
      },
    },
  },
}
