return {
  "olimorris/codecompanion.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "ravitemer/codecompanion-history.nvim",
    "echasnovski/mini.diff",
  },
  config = function()
    -- 1. Optimize mini.diff
    require("mini.diff").setup({
      view = {
        style = "sign", -- Use sign column for diffs
        signs = {
          add = "▎", -- Consistent with gitsigns style
          change = "▎",
          delete = "",
        },
      },
    })

    -- Enable mini.diff for CodeCompanion buffers
    vim.api.nvim_create_autocmd("FileType", {
      pattern = "codecompanion",
      callback = function()
        require("mini.diff").enable(0)
      end,
    })

    -- 2. CodeCompanion core optimization
    require("codecompanion").setup({
      adapters = {
        gemini_cli = function()
          return require("codecompanion.adapters").extend("gemini_cli", {
            command = "gemini",
            env = {
              GEMINI_API_KEY = os.getenv("GEMINI_API_KEY"),
            },
            schema = {
              model = {
                default = "gemini-2.0-flash-exp",
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
          provider = "telescope",
          opts = {
            show_preset_actions = true,
            show_preset_prompts = true,
          },
        },
        chat = {
          show_settings = false,
          show_token_count = true,
          show_spinner = true,
          render_headers = true,
          auto_scroll = true,
          window = {
            layout = "vertical",
            position = "right",
            width = 0.40, -- Slightly narrower for better balance
            opts = {
              breakindent = true,
              cursorline = true,
              spell = false,
              wrap = true,
              signcolumn = "yes",
              number = false,
              relativenumber = false,
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
          adapter = "gemini_cli",
          roles = {
            llm = "Gemini",
            user = "Me",
          },
          slash_commands = {
            ["file"] = {
              callback = "chat.slash_commands.file",
              description = "Select a file",
              opts = { provider = "telescope", contains_code = true },
            },
            ["buffer"] = {
              callback = "chat.slash_commands.buffer",
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
          adapter = "gemini_cli",
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
          adapter = "gemini_cli",
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
      -- Normal Mode
      { "<leader>a",  group = "AI (CodeCompanion)" },
      { "<leader><leader>", "<cmd>CodeCompanionChat toggle<cr>", desc = "Toggle AI Chat (Fast)" },
      { "<leader>ac", "<cmd>CodeCompanionChat toggle<cr>",   desc = "Toggle Chat" },
      { "<leader>aa", "<cmd>CodeCompanion<cr>",              desc = "Inline Assistant" },
      { "<leader>ap", "<cmd>CodeCompanionActions<cr>",       desc = "Action Palette" },
      { "<leader>ad", "<cmd>CodeCompanionDiff<cr>",          desc = "Current Diff" },
      { "<leader>al", "<cmd>CodeCompanionChat diff<cr>",     desc = "All Diffs" },

      -- Visual Mode
      { "<leader>a",  group = "AI (CodeCompanion)",          mode = "v" },
      { "<leader>aa", ":CodeCompanion<cr>",                  desc = "Inline Assistant",    mode = "v" },
      { "<leader>ac", ":CodeCompanionChat<cr>",              desc = "Chat with Selection", mode = "v" },
    })

    -- 4. Progress display (Fidget.nvim integration)
    local group = vim.api.nvim_create_augroup("CodeCompanionHooks", {})
    local fidget_handles = {}

    vim.api.nvim_create_autocmd("User", {
      pattern = "CodeCompanionRequestStarted",
      group = group,
      callback = function(request)
        local id = request.data.id
        fidget_handles[id] = require("fidget.progress").handle.create({
          title = " CodeCompanion",
          message = "Generating...",
          lsp_client = { name = "AI" },
        })
      end,
    })

    vim.api.nvim_create_autocmd("User", {
      pattern = "CodeCompanionRequestFinished",
      group = group,
      callback = function(request)
        local id = request.data.id
        if fidget_handles[id] then
          fidget_handles[id]:finish()
          fidget_handles[id] = nil
        end
      end,
    })
  end,
}
