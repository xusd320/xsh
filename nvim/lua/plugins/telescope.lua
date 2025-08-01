return {
  {
    "nvim-telescope/telescope.nvim",
    dependencies = {
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
        find_command = { "fd", "--type", "f", "--hidden", "--exclude", ".git" },
        layout_strategy = "horizontal",
        layout_config = {
          horizontal = {
            width = 0.9,
            height = 0.9,
            preview_width = 0.5,
            preview_cutoff = 0,
            prompt_position = "bottom",
          },
        },
        live_grep = {
          only_cwd = true,
        },
        sorting_strategy = "ascending",
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
          "--smart-case",
          "--hidden",
          "--glob",
          "!.git/",
        },
      },
    },
    keys = {
      { "<leader>fr", LazyVim.pick("oldfiles", { cwd = vim.uv.cwd() }), desc = "Recent (cwd)" },
      { "<leader>fR", "<cmd>Telescope oldfiles<cr>", desc = "Recent" },
    },
  },
}
