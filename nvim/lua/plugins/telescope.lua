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
        "princejoogie/dir-telescope.nvim",
        config = function()
          require("lazyvim.util").on_load("telescope.nvim", function()
            require("dir-telescope").setup({
              hidden = false,
              no_ignore = true,
              show_preview = true,
            })
            require("telescope").load_extension("dir")
          end)
        end,
        keys = {
          {
            "<leader>sf",
            function()
              require("telescope").extensions.dir.live_grep()
            end,
            desc = "Grep in directory",
          },
          {
            "<leader>fd",
            function()
              require("telescope").extensions.dir.find_files()
            end,
            desc = "Find files in directory",
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
            preview_width = 0.5,
            preview_cutoff = 60,
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
