return {
  "olimorris/codecompanion.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "ravitemer/mcphub.nvim",
    {
      "Davidyz/VectorCode",
      build = "pipx upgrade vectorcode",
      dependencies = { "nvim-lua/plenary.nvim" },
    },
    {
      "MeanderingProgrammer/render-markdown.nvim",
      ft = { "markdown", "codecompanion" },
    },
    {
      "echasnovski/mini.diff",
      config = function()
        local diff = require("mini.diff")
        diff.setup({
          source = diff.gen_source.none(),
        })
      end,
    },
    {
      "HakonHarnes/img-clip.nvim",
      opts = {
        filetypes = {
          codecompanion = {
            prompt_for_file_name = false,
            template = "[Image]($FILE_PATH)",
            use_absolute_path = true,
          },
        },
      },
    },
  },
  config = function()
    require("codecompanion").setup({
      adapters = {
        opts = {
          allow_insecure = true,
          proxy = "http://127.0.0.1:7897",
        },
      },
      display = {
        action_palette = {
          width = 95,
          height = 10,
          prompt = "Prompt ",
          provider = "default",
          opts = {
            show_default_actions = true,
            show_default_prompt_library = true,
          },
        },
      },
      extensions = {
        mcphub = {
          callback = "mcphub.extensions.codecompanion",
          opts = {
            make_vars = true,
            make_slash_commands = true,
            show_result_in_chat = true,
          },
        },
      },
      strategies = {
        chat = {
          adapter = "gemini",
        },

        inline = {
          adapter = "gemini",
        },
        cmd = {
          adapter = "gemini",
        },
      },
      vectorcode = {
        opts = {
          add_tool = true,
        },
      },
    })

    vim.keymap.del("n", "<leader><Space>")

    require("which-key").add({
      { "<leader><Space>", group = "CodeCompanion", mode = {} },
      { "<leader><Space>a", "<cmd>CodeCompanion<cr>", desc = "CodeCompanion Prompt" },
      { "<leader><Space>A", "<cmd>CodeCompanionActions<cr>", desc = "CodeCompanion Actions" },
      { "<leader><Space>c", "<cmd>CodeCompanionChat<cr>", desc = "CodeCompanion Chat" },
      { "<leader><Space>C", "<cmd>CodeCompanionCmd<cr>", desc = "CodeCompanion Cmd" },
    })
  end,
}
