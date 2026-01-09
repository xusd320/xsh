return {
  "olimorris/codecompanion.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "ravitemer/codecompanion-history.nvim",
    "echasnovski/mini.diff",
    {
      "MeanderingProgrammer/render-markdown.nvim",
      ft = { "markdown", "codecompanion" },
    },
  },
  config = function()
    -- 1. Optimize mini.diff
    require("mini.diff").setup({
      view = {
        style = "overlay", -- Overlay mode, does not break layout
        signs = {
          add = "▎", -- Consistent with gitsigns style
          change = "▎",
          delete = "",
        },
      },
      source = {
        -- Enable only when CodeCompanion is active
        vim.cmd([[au FileType codecompanion lua require('mini.diff').enable(0)]])
      }
    })

    -- 2. CodeCompanion core optimization
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
            opts = {
              user_approval = true,
            },
          })
        end,
      },

      display = {
        action_palette = {
          width = 95,
          height = 10,
          provider = "default", -- Or "telescope" if you prefer
          opts = {
            show_preset_actions = true,
            show_preset_prompts = true,
          },
        },
        chat = {
          show_settings = false, -- Reduce visual noise
          show_token_count = true,
          show_spinner = true,
          render_headers = true,
          auto_scroll = true,
          window = {
            layout = "vertical",
            position = "left", -- Move to the left
            width = 0.45,
            opts = {
              breakindent = true,
              cursorline = true,
              spell = false,
              wrap = true,
            },
          },
        },
        diff = {
          enabled = true,
          close_chat_at_completion = true,
          provider = "mini_diff",
        },
      },

      interactions = {
        chat = {
          adapter = "opencode",
          roles = {
            llm = "Gemini",
            user = "Me",
          },
          slash_commands = {
            ["file"] = {
              callback = "strategies.chat.slash_commands.file",
              description = "Select a file",
              opts = { provider = "telescope", contains_code = true },
            },
            ["buffer"] = {
              callback = "strategies.chat.slash_commands.buffer",
              description = "Select a buffer",
              opts = { provider = "telescope", contains_code = true },
            },
          },
          opts = {
            auto_submit = false,
            stop_at_diff = true,
          },
        },
        inline = {
          adapter = "opencode",
          keymaps = {
            accept_change = { modes = { n = "ga" }, index = 1, desc = "Accept change" },
            reject_change = { modes = { n = "gr" }, index = 2, desc = "Reject change" },
          },
          opts = {
            user_approval = true,
            show_diff = true,
            stop_at_diff = true,
          },
        },
        agent = {
          adapter = "opencode",
          tools = {
            ["files"] = {
              opts = { user_approval = true },
            },
          },
          opts = {
            show_diff = true,
            stop_at_diff = true,
            yolo = false,
            max_iterations = 10,
          },
        },
      },

      opts = {
        log_level = "ERROR",
        send_code = true,
        use_default_actions = true,
        use_default_prompts = true,
      },
    })

    -- 3. Keymap optimization (Which-Key style)
    require("which-key").add({
      { "<leader><Space>",  group = "CodeCompanion",         mode = {} },
      { "<leader><Space>a", "<cmd>CodeCompanion<cr>",        desc = "Inline Assistant" },
      { "<leader><Space>c", "<cmd>CodeCompanionChat toggle<cr>", desc = "Toggle Chat" },
      { "<leader><Space>A", "<cmd>CodeCompanionActions<cr>", desc = "Action Palette" },
      { "<leader><Space>d", "<cmd>CodeCompanionDiff<cr>",    desc = "Current Diff" },
      { "<leader><Space>D", "<cmd>CodeCompanionChat diff<cr>", desc = "Session Diff (All Files)" },
      -- Visual mode keymaps
      { "<leader><Space>",  group = "CodeCompanion",         mode = "v" },
      { "<leader><Space>a", ":CodeCompanion<cr>",            desc = "Inline Assistant", mode = "v" },
      { "<leader><Space>c", ":CodeCompanionChat<cr>",        desc = "Chat with Selection", mode = "v" },
    })

    -- 4. Progress display (Fidget.nvim integration)
    local group = vim.api.nvim_create_augroup("CodeCompanionHooks", {})
    local fidget_handle = nil

    vim.api.nvim_create_autocmd("User", {
      pattern = "CodeCompanionRequestStarted",
      group = group,
      callback = function()
        fidget_handle = require("fidget.progress").handle.create({
          title = " CodeCompanion",
          message = "Generating...",
          lsp_client = { name = "AI" },
        })
      end,
    })

    vim.api.nvim_create_autocmd("User", {
      pattern = "CodeCompanionRequestFinished",
      group = group,
      callback = function()
        if fidget_handle then
          fidget_handle:finish()
          fidget_handle = nil
        end
      end,
    })
  end,
}
