return {
  "olimorris/codecompanion.nvim",
  event = { "BufRead", "BufNewFile" },
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "ravitemer/mcphub.nvim",
    {
      "Davidyz/VectorCode",
      build = "pipx upgrade vectorcode",
      dependencies = { "nvim-lua/plenary.nvim" },
    },
  },
  config = function()
    require("codecompanion").setup({
      adapters = {
        gemini = function()
          return require("codecompanion.adapters").extend("gemini", {
            api_key = function()
              return os.getenv("GEMINI_API_KEY")
            end,
          })
        end,
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
    require("which-key").add({
      { "<leader>a", group = "CodeCompanion" },
      { "<leader>aa", "<cmd>CodeCompanion<cr>", desc = "CodeCompanion Prompt" },
      { "<leader>ab", "<cmd>CodeCompanionChat<cr>", desc = "CodeCompanion Chat" },
      { "<leader>ac", "<cmd>CodeCompanionActions<cr>", desc = "CodeCompanion Actions" },
      { "<leader>ad", "<cmd>CodeCompanionCmd<cr>", desc = "CodeCompanion Cmd" },
    })
  end,
}
