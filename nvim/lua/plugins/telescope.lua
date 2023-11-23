return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
      {
        "ahmedkhalf/project.nvim",
        opts = {
          manual_mode = false,
          detection_methods = { "pattern" },
          patterns = { ".git" },
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
      pickers = {
        lsp_definitions = {
          show_line = false,
        },
        lsp_references = {
          show_line = false,
        },
        lsp_implementations = {
          show_line = false,
        },
        lsp_type_definitions = {
          show_line = false,
        },
        lsp_incoming_calls = {
          show_line = false,
        },
        lsp_outgoing_calls = {
          show_line = false,
        },
        lsp_workspace_symbols = {
          show_line = false,
        },
        lsp_document_symbols = {
          show_line = false,
        },

        lsp_dynamic_workspace_symbols = {
          show_line = false,
        },
        diagnostics = {
          disable_coordinates = true,
        },
        treesitter = {
          show_line = false,
        },
        tags = {
          show_line = false,
        },
        current_buffer_tags = {
          show_line = false,
        },
        quickfix = {
          show_line = false,
        },
        loclist = {
          show_line = false,
        },
        jumplist = {
          show_line = false,
        },
        tagstack = {
          show_line = false,
        },
      },
    },
  },
}
