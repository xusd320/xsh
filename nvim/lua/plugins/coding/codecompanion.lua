return {
  "olimorris/codecompanion.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "ravitemer/codecompanion-history.nvim",
    "echasnovski/mini.diff",
    "sindrets/diffview.nvim", -- Added for better diff view
    "stevearc/dressing.nvim", -- Better UI for inputs
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    -- 1. Optimize mini.diff (keep for inline diffs)
    require("mini.diff").setup({
      view = {
        style = "sign",
        signs = { add = "▎", change = "▎", delete = "" },
      },
    })

    -- 2. Monkey-patch: guard against invalid buffer in editor_context/buffer replace
    -- Upstream bug: https://github.com/olimorris/codecompanion.nvim/issues/952
    do
      local buf_ec = require("codecompanion.interactions.chat.editor_context.buffer")
      local original_replace = buf_ec.replace
      buf_ec.replace = function(prefix, message, bufnr)
        if not vim.api.nvim_buf_is_valid(bufnr) then
          bufnr = vim.api.nvim_get_current_buf()
        end
        if not vim.api.nvim_buf_is_valid(bufnr) then
          return message:gsub(vim.pesc(prefix) .. "{buffer}", "unknown buffer")
        end
        return original_replace(prefix, message, bufnr)
      end
    end

    -- 3. CodeCompanion core optimization
    require("codecompanion").setup({
      adapters = {
        gemini_cli = function()
          return require("codecompanion.adapters").extend("gemini_cli", {
            command = "gemini",
            args = {
              "--acp",
              "--quiet",
            },
            schema = {
              model = {
                default = "gemini-3.1-pro-preview",
                choices = {
                  "gemini-3.1-pro-preview",
                  "gemini-3.1-flash-preview",
                  "gemini-3.1-flash-lite",
                },
              },
            },
            -- Extend capabilities for more advanced agentic behavior
            parameters = {
              clientCapabilities = {
                fs = {
                  readTextFile = true,
                  writeTextFile = true,
                  listFiles = true,
                  searchFiles = true,
                },
              },
            },
            opts = {
              user_approval = true,
              show_model_choices = true,
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
            width = 0.45,
            opts = {
              breakindent = true,
              cursorline = true,
              spell = false,
              wrap = true,
              signcolumn = "yes",
              number = false,
              relativenumber = false,
              -- Optimization: Set foldmethod to manual to prevent startup hang
              foldenable = true,
              foldmethod = "manual",
            },
          },
          icons = {
            buffer_sync_all = "󰪴 ",
            buffer_sync_diff = " ",
            chat_fold = " ",
            tool_pending = " ",
            tool_in_progress = " ",
            tool_failure = " ",
            tool_success = " ",
          },
        },
        diff = {
          enabled = true,
          close_chat_at_completion = false, -- Keep chat open to review changes
          provider = "diffview", -- Use diffview for much better experience
          list_opencmd = "vsplit", -- Open diff list in a vertical split
        },
        icons = {
          warning = " ",
        },
      },

      interactions = {
        chat = {
          adapter = "gemini_cli",
          roles = {
            llm = " Gemini",
            user = " Me",
          },
          slash_commands = {
            ["file"] = {
              path = "interactions.chat.slash_commands.builtin.file",
              description = "Insert a file",
              opts = { provider = "telescope", contains_code = true },
            },
            ["buffer"] = {
              path = "interactions.chat.slash_commands.builtin.buffer",
              description = "Insert a buffer",
              opts = { provider = "telescope", contains_code = true },
            },
            ["symbols"] = {
              path = "interactions.chat.slash_commands.builtin.symbols",
              description = "Insert symbols",
              opts = { provider = "telescope", contains_code = true },
            },
            ["help"] = {
              path = "interactions.chat.slash_commands.builtin.help",
              description = "Insert help tags",
            },
          },
          keymaps = {
            send = {
              modes = { n = { "<CR>", "<C-s>" }, i = "<C-s>" },
              index = 1,
              callback = "keymaps.send",
              description = "Send response",
            },
            close = {
              modes = { n = "q", i = "<C-c>" },
              index = 2,
              callback = "keymaps.close",
              description = "Close chat",
            },
            regenerate = {
              modes = { n = "gr" },
              index = 3,
              callback = "keymaps.regenerate",
              description = "Regenerate",
            },
          },
          opts = {
            auto_submit = false,
            stop_at_diff = true,
          },
        },
        inline = {
          adapter = "gemini_cli",
          opts = {
            user_approval = true,
            show_diff = true,
            stop_at_diff = true,
          },
        },
        agent = {
          adapter = "gemini_cli",
          tools = {
            ["files"] = { opts = { user_approval = true } },
            ["run_command"] = { opts = { user_approval = true } },
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
        triggers = {
          slash_commands = "/",
          editor_context = "#",
          tools = "@",
        },
      },
    })

    -- 3. Keymap optimization
    require("which-key").add({
      { "<leader>a", group = "AI (CodeCompanion)" },
      { "<leader><leader>", "<cmd>CodeCompanionChat toggle<cr>", desc = "Toggle AI Chat" },
      { "<leader>ac", "<cmd>CodeCompanionChat toggle<cr>", desc = "Toggle Chat" },
      { "<leader>aa", "<cmd>CodeCompanion<cr>", desc = "Inline Assistant" },
      { "<leader>ap", "<cmd>CodeCompanionActions<cr>", desc = "Action Palette" },
      { "<leader>ad", "<cmd>CodeCompanionDiff<cr>", desc = "Current Diff" },
      { "<leader>al", "<cmd>CodeCompanionChat diff<cr>", desc = "All Diffs" },
      { "<leader>as", "<cmd>CodeCompanionChat stop<cr>", desc = "Stop Generation" },

      { "<leader>a", group = "AI (CodeCompanion)", mode = "v" },
      { "<leader>aa", ":CodeCompanion<cr>", desc = "Inline Assistant", mode = "v" },
      { "<leader>ac", ":CodeCompanionChat<cr>", desc = "Chat with Selection", mode = "v" },
    })

    -- 4. Progress display
    local fidget_handles = {}
    local group = vim.api.nvim_create_augroup("CodeCompanionHooks", {})

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

    -- 5. Set highlight groups for role headers
    vim.api.nvim_set_hl(0, "CodeCompanionChatHeader", { link = "Title", bold = true })
    vim.api.nvim_set_hl(0, "CodeCompanionChatSeparator", { link = "Comment" })
  end,
}
