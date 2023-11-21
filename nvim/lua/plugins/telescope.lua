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
          local tail = require("telescope.utils").path_tail(path)
          local path_in_cwd = string.gsub(path, string.gsub(cwd, "%-", "%%-"), ".")
          local shorten_path = string.gsub(path_in_cwd, home, "~")
          return string.format("%s (%s)", tail, shorten_path), { { { 1, #tail }, "Constant" } }
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
