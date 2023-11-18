return {
  {
    "LazyVim/LazyVim",
    opts = {
      colorscheme = "catppuccin",
    },
  },
  {
    "folke/noice.nvim",
    opts = {
      routes = {
        {
          view = "cmdline",
          filter = { event = "msg_showmode" },
        },
      },
      lsp = {
        override = {
          ["vim.lsp.util.convert_input_to_markdown_lines"] = true,
          ["vim.lsp.util.stylize_markdown"] = true,
          ["cmp.entry.get_documentation"] = true,
        },
      },
      cmdline = {
        view = "cmdline",
      },
      messages = {
        enabled = true,
        view = "cmdline",
      },
      presets = {
        bottom_search = true,
        command_palette = true,
        long_message_to_split = true,
        inc_rename = false,
        lsp_doc_border = true,
      },
    },
  },
  {
    "lyokha/vim-xkbswitch",
    lazy = true,
  },
  {
    "nvim-neo-tree/neo-tree.nvim",
    opts = {
      window = {
        position = "right",
      },
    },
  },
  {
    "lewis6991/gitsigns.nvim",
    opts = {
      current_line_blame = true,
      current_line_blame_opts = {
        delay = 200,
      },
    },
  },
  {
    "nvim-lualine/lualine.nvim",
    opts = {
      options = {
        component_separators = "|",
        section_separators = { left = "", right = "" },
      },
      sections = {
        lualine_a = { "mode" },
        lualine_b = { "branch" },
        lualine_c = { { "filename", path = 1 } },
        lualine_x = { "filetype" },
        lualine_y = { "location" },
        lualine_z = { "progress" },
      },
    },
  },
  {
    "hrsh7th/nvim-cmp",
    dependencies = {
      {
        "f3fora/cmp-spell",
      },
    },
    opts = function(_, opts)
      table.insert(opts.sources, {
        name = "spell",
        option = {
          keep_all_entries = false,
          enable_in_context = function()
            return true
          end,
        },
      })
    end,
  },
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
  {
    "TabbyML/vim-tabby",
    lazy = false,
  },
}
