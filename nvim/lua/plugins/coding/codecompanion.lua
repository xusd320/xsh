return {
  "olimorris/codecompanion.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "ravitemer/codecompanion-history.nvim",
    {
      "MeanderingProgrammer/render-markdown.nvim",
      ft = { "markdown", "codecompanion" },
    },
  },
  config = function()
    require("codecompanion").setup({
      adapters = {
        opencode = function()
          return require("codecompanion.adapters").extend("opencode", {
            env = {
              GEMINI_API_KEY = os.getenv("GEMINI_API_KEY"),
            },
            schema = {
              model = {
                default = "gemini-3-flash-preview",
              },
            },
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
        history = {
          enabled = true,
        },
      },
      strategies = {
        chat = {
          adapter = "opencode",
        },
        inline = {
          adapter = "opencode",
        },
        agent = {
          adapter = "opencode",
        },
      },
    })

    require("which-key").add({
      { "<leader><Space>",  group = "CodeCompanion",         mode = {} },
      { "<leader><Space>a", "<cmd>CodeCompanion<cr>",        desc = "CodeCompanion Prompt" },
      { "<leader><Space>A", "<cmd>CodeCompanionActions<cr>", desc = "CodeCompanion Actions" },
      { "<leader><Space>c", "<cmd>CodeCompanionChat<cr>",    desc = "CodeCompanion Chat" },
      { "<leader><Space>C", "<cmd>CodeCompanionCmd<cr>",     desc = "CodeCompanion Cmd" },
    })
  end,
}
