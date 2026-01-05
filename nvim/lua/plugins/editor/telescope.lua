return {
  "nvim-telescope/telescope.nvim",
  dependencies = {
    "nvim-lua/plenary.nvim",
    {
      "nvim-telescope/telescope-fzf-native.nvim",
      build = "make",
    },
    "nvim-telescope/telescope-ui-select.nvim",
    {
      "princejoogie/dir-telescope.nvim",
      config = function()
        require("dir-telescope").setup({
          hidden = false,
          no_ignore = true,
          show_preview = true,
        })
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
      prompt_prefix = "   ",
      selection_caret = "󰁔 ",
      entry_prefix = "  ",
      mappings = {
        i = {
          ["<c-t>"] = function(...)
            return require("trouble.providers.telescope").open_with_trouble(...)
          end,
          ["<a-t>"] = function(...)
            return require("trouble.providers.telescope").open_selected_with_trouble(...)
          end,
          ["<a-i>"] = function()
            local flash = require("telescope").extensions.flash
            return flash.jump()
          end,
          ["<C-Down>"] = function(...)
            return require("telescope.actions").cycle_history_next(...)
          end,
          ["<C-Up>"] = function(...)
            return require("telescope.actions").cycle_history_prev(...)
          end,
          ["<C-f>"] = function(...)
            return require("telescope.actions").preview_scrolling_down(...)
          end,
          ["<C-b>"] = function(...)
            return require("telescope.actions").preview_scrolling_up(...)
          end,
        },
        n = {
          ["q"] = function(...)
            return require("telescope.actions").close(...)
          end,
        },
      },
      find_command = { "fd", "--type", "f", "--hidden", "--exclude", ".git" },
      layout_strategy = "horizontal",
      layout_config = {
        horizontal = {
          width = 0.9,
          height = 0.9,
          preview_width = 0.5,
          preview_cutoff = 0,
          prompt_position = "top",
        },
      },
      sorting_strategy = "ascending",
      results_title = false,
      path_display = {
        filename_first = true,
      },
      preview = {
        filesize_limit = 10,
        highlight_limit = 0.25,
        timeout = 1000,
      },
      vimgrep_arguments = {
        "rg",
        "--color=never",
        "--no-heading",
        "--with-filename",
        "--line-number",
        "--column",
        "--case-sensitive",
        "--hidden",
        "--glob",
        "!.git/",
      },
    },
    extensions = {
      ["ui-select"] = require("telescope.themes").get_dropdown({
        layout_config = {
          width = 0.6,
          height = 0.4,
        },
      }),
      fzf = {
        fuzzy = true,
        override_generic_sorter = true,
        override_file_sorter = true,
        case_mode = "respect_case",
      },
    },
  },
  keys = {
    {
      "<leader>,",
      "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>",
      desc = "Switch Buffer",
    },
    { "<leader>/",       "<cmd>Telescope live_grep<cr>",                                desc = "Grep (Root Dir)" },
    { "<leader>:",       "<cmd>Telescope command_history<cr>",                          desc = "Command History" },
    { "<leader><space>", "<cmd>Telescope find_files<cr>",                               desc = "Find Files (Root Dir)" },
    -- find
    { "<leader>fb",      "<cmd>Telescope buffers sort_mru=true sort_lastused=true<cr>", desc = "Buffers" },
    { "<leader>ff",      "<cmd>Telescope find_files cwd=false<cr>",                     desc = "Find Files (cwd)" },
    { "<leader>fF",      "<cmd>Telescope find_files<cr>",                               desc = "Find Files (Root Dir)" },
    {
      "<leader>fr",
      function()
        require("telescope.builtin").oldfiles({ cwd_only = true })
      end,
      desc = "Recent (cwd)",
    },
    { "<leader>fR",      "<cmd>Telescope oldfiles<cr>",                                 desc = "Recent" },
    -- git
    { "<leader>gc",      "<cmd>Telescope git_commits<CR>",                              desc = "Commits" },
    { "<leader>gs",      "<cmd>Telescope git_status<CR>",                               desc = "Status" },
    -- search
    { '<leader>s"',      "<cmd>Telescope registers<cr>",                                desc = "Registers" },
    { "<leader>sa",      "<cmd>Telescope autocommands<cr>",                             desc = "Auto Commands" },
    { "<leader>sb",      "<cmd>Telescope current_buffer_fuzzy_find<cr>",                desc = "Buffer" },
    { "<leader>sc",      "<cmd>Telescope command_history<cr>",                          desc = "Command History" },
    { "<leader>sC",      "<cmd>Telescope commands<cr>",                                 desc = "Commands" },
    { "<leader>sd",      "<cmd>Telescope diagnostics bufnr=0<cr>",                      desc = "Document Diagnostics" },
    { "<leader>sD",      "<cmd>Telescope diagnostics<cr>",                              desc = "Workspace Diagnostics" },
    { "<leader>sg",      "<cmd>Telescope live_grep cwd=false<cr>",                      desc = "Grep (cwd)" },
    { "<leader>sG",      "<cmd>Telescope live_grep<cr>",                                desc = "Grep (Root Dir)" },
    { "<leader>sh",      "<cmd>Telescope help_tags<cr>",                                desc = "Help Pages" },
    { "<leader>sH",      "<cmd>Telescope highlights<cr>",                               desc = "Search Highlight Groups" },
    { "<leader>sk",      "<cmd>Telescope keymaps<cr>",                                  desc = "Key Maps" },
    { "<leader>sM",      "<cmd>Telescope man_pages<cr>",                                desc = "Man Pages" },
    { "<leader>sm",      "<cmd>Telescope marks<cr>",                                    desc = "Jump to Mark" },
    { "<leader>so",      "<cmd>Telescope vim_options<cr>",                              desc = "Options" },
    { "<leader>sR",      "<cmd>Telescope resume<cr>",                                   desc = "Resume" },
    {
      "<leader>sw",
      function()
        require("telescope.builtin").grep_string({ cwd = false, word_match = "-w" })
      end,
      desc = "Word (cwd)",
    },
    {
      "<leader>sW",
      function()
        require("telescope.builtin").grep_string({ word_match = "-w" })
      end,
      desc = "Word (Root Dir)",
    },
    {
      "<leader>sw",
      function()
        local saved_reg = vim.fn.getreg("v")
        vim.cmd('noau normal! "vy"')
        local text = vim.fn.getreg("v")
        vim.fn.setreg("v", saved_reg)
        require("telescope.builtin").grep_string({ cwd = false, search = text })
      end,
      mode = "v",
      desc = "Selection (cwd)",
    },
    {
      "<leader>sW",
      function()
        local saved_reg = vim.fn.getreg("v")
        vim.cmd('noau normal! "vy"')
        local text = vim.fn.getreg("v")
        vim.fn.setreg("v", saved_reg)
        require("telescope.builtin").grep_string({ search = text })
      end,
      mode = "v",
      desc = "Selection (Root Dir)",
    },
    { "<leader>uC", "<cmd>Telescope colorscheme<cr>", desc = "Colorscheme with Preview" },
    {
      "<leader>ss",
      function()
        require("telescope.builtin").lsp_document_symbols()
      end,
      desc = "Goto Symbol",
    },
    {
      "<leader>sS",
      function()
        require("telescope.builtin").lsp_dynamic_workspace_symbols()
      end,
      desc = "Goto Symbol (Workspace)",
    },
  },
  config = function(_, opts)
    local telescope = require("telescope")
    telescope.setup(opts)
    pcall(telescope.load_extension, "dir")
    pcall(telescope.load_extension, "fzf")
    pcall(telescope.load_extension, "flash")
    pcall(telescope.load_extension, "ui-select")
  end,
}
