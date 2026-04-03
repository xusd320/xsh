return {
  "olimorris/codecompanion.nvim",
  lazy = false,
  dependencies = {
    "nvim-lua/plenary.nvim",
    "nvim-treesitter/nvim-treesitter",
    "ravitemer/codecompanion-history.nvim",
    "echasnovski/mini.diff",
    "sindrets/diffview.nvim",
    "stevearc/dressing.nvim",
    "nvim-telescope/telescope.nvim",
  },
  config = function()
    -- 0. Compat shim: silence deprecated vim.validate{table} warnings from upstream plugins
    -- codecompanion/git-conflict use old-style vim.validate({k={v,"type"}}) which is deprecated in Nvim 0.12+
    -- This shim detects old-style calls and translates them to the new API
    local original_validate = vim.validate
    -- Old API used single-char abbreviations; new API requires full type names
    local type_aliases = { s = "string", n = "number", t = "table", b = "boolean", f = "function" }
    vim.validate = function(name, ...)
      if type(name) == "table" then
        for k, v in pairs(name) do
          local value, expected, optional = v[1], v[2], v[3]
          if type(expected) == "function" then
            -- Old API allowed a custom validator function; call it directly
            local ok, err = expected(value)
            if not ok then
              error(string.format("invalid argument '%s': %s", k, err or "validation failed"))
            end
          else
            -- Translate type abbreviations (e.g. 'n' -> 'number')
            expected = type_aliases[expected] or expected
            original_validate(k, value, expected, optional)
          end
        end
        return
      end
      return original_validate(name, ...)
    end

    -- 1. Optimize mini.diff (keep for inline diffs)
    require("mini.diff").setup({
      view = {
        style = "sign",
        signs = { add = "▎", change = "▎", delete = "" },
      },
    })

    -- 2. Monkey-patch: guard against invalid buffer in editor_context/buffer replace
    -- Upstream bug: https://github.com/olimorris/codecompanion.nvim/issues/952
    do
      local buf_ec = require("codecompanion.interactions.shared.editor_context.buffer")
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

    -- 3. CodeCompanion core setup
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

      -- ── Extensions ──────────────────────────────────────────────────
      extensions = {
        history = {
          enabled = true,
          opts = {
            auto_save = true,
            expiration_days = 30,
            picker = "telescope",
            keymap = "gh",
            save_chat_keymap = "gs",
            continue_last_chat = false,
            delete_on_clearing_chat = false,
            auto_generate_title = true,
            title_generation_opts = {
              refresh_every_n_prompts = 3,
              max_refreshes = 3,
            },
          },
        },
      },

      -- ── Display ─────────────────────────────────────────────────────
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
          show_reasoning = true,
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
              foldenable = true,
              foldmethod = "manual",
            },
          },
          icons = {
            buffer_sync_all = "󰪴 ",
            buffer_sync_diff = " ",
            chat_fold = " ",
            tool_pending = " ",
            tool_in_progress = " ",
            tool_failure = " ",
            tool_success = " ",
          },
        },
        diff = {
          enabled = true,
          close_chat_at_completion = false,
          provider = "diffview",
          list_opencmd = "vsplit",
        },
        icons = {
          warning = " ",
        },
      },

      -- ── Interactions ────────────────────────────────────────────────
      interactions = {
        chat = {
          adapter = "gemini_cli",
          roles = {
            llm = " Gemini",
            user = " Me",
          },
          -- Slash commands
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
              opts = { provider = "telescope" },
            },
            ["fetch"] = {
              path = "interactions.chat.slash_commands.builtin.fetch",
              description = "Insert URL contents",
              opts = { adapter = "jina" },
            },
            ["now"] = {
              path = "interactions.chat.slash_commands.builtin.now",
              description = "Insert current date/time",
            },
            ["command"] = {
              path = "interactions.chat.slash_commands.builtin.command",
              description = "Change ACP command",
            },
            ["mode"] = {
              path = "interactions.chat.slash_commands.builtin.mode",
              description = "Change ACP mode",
            },
            ["compact"] = {
              path = "interactions.chat.slash_commands.builtin.compact",
              description = "Compact chat history",
            },
            ["image"] = {
              path = "interactions.chat.slash_commands.builtin.image",
              description = "Insert an image",
            },
          },
          -- Chat buffer keymaps
          keymaps = {
            send = {
              modes = { n = { "<CR>", "<C-s>" }, i = "<C-s>" },
              index = 1,
              callback = "keymaps.send",
              description = "[Request] Send",
            },
            close = {
              modes = { n = "<C-c>", i = "<C-c>" },
              index = 2,
              callback = "keymaps.close",
              description = "[Chat] Close",
            },
            stop = {
              modes = { n = "q" },
              index = 3,
              callback = "keymaps.stop",
              description = "[Request] Stop",
            },
            regenerate = {
              modes = { n = "gr" },
              index = 4,
              callback = "keymaps.regenerate",
              description = "[Request] Regenerate",
            },
            clear = {
              modes = { n = "gx" },
              index = 5,
              callback = "keymaps.clear",
              description = "[Chat] Clear",
            },
            codeblock = {
              modes = { n = "gc" },
              index = 6,
              callback = "keymaps.codeblock",
              description = "[Chat] Insert codeblock",
            },
            yank_code = {
              modes = { n = "gy" },
              index = 7,
              callback = "keymaps.yank_code",
              description = "[Chat] Yank code",
            },
            fold_code = {
              modes = { n = "gf" },
              index = 8,
              callback = "keymaps.fold_code",
              description = "[Chat] Fold code",
            },
            next_header = {
              modes = { n = "]]" },
              index = 9,
              callback = "keymaps.next_header",
              description = "[Nav] Next header",
            },
            previous_header = {
              modes = { n = "[[" },
              index = 10,
              callback = "keymaps.previous_header",
              description = "[Nav] Previous header",
            },
            next_chat = {
              modes = { n = "}" },
              index = 11,
              callback = "keymaps.next_chat",
              description = "[Nav] Next chat",
            },
            previous_chat = {
              modes = { n = "{" },
              index = 12,
              callback = "keymaps.previous_chat",
              description = "[Nav] Previous chat",
            },
            change_adapter = {
              modes = { n = "ga" },
              index = 13,
              callback = "keymaps.change_adapter",
              description = "[Adapter] Change adapter/model",
            },
            goto_file_under_cursor = {
              modes = { n = "gR" },
              index = 14,
              callback = "keymaps.goto_file_under_cursor",
              description = "[Chat] Open file under cursor",
            },
            debug = {
              modes = { n = "gd" },
              index = 15,
              callback = "keymaps.debug",
              description = "[Chat] View debug info",
            },
            system_prompt = {
              modes = { n = "gP" },
              index = 16,
              callback = "keymaps.toggle_system_prompt",
              description = "[Chat] Toggle system prompt",
            },
            buffer_sync_all = {
              modes = { n = "gba" },
              index = 17,
              callback = "keymaps.buffer_sync_all",
              description = "[Chat] Toggle buffer sync",
            },
            buffer_sync_diff = {
              modes = { n = "gbd" },
              index = 18,
              callback = "keymaps.buffer_sync_diff",
              description = "[Chat] Toggle buffer diff sync",
            },
            options = {
              modes = { n = "?" },
              callback = "keymaps.options",
              description = "Show all keymaps",
              hide = true,
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

      -- ── Prompt Library ──────────────────────────────────────────────
      prompt_library = {
        ["Code Review"] = {
          strategy = "chat",
          description = "Review code for bugs, performance, and best practices",
          opts = {
            index = 1,
            is_default = true,
            is_slash_cmd = false,
            modes = { "v" },
            short_name = "review",
            auto_submit = true,
          },
          prompts = {
            {
              role = "system",
              content = [[You are an expert code reviewer. Analyze the provided code carefully and provide feedback on:
1. **Bugs & Logic Errors** - identify potential bugs or incorrect logic
2. **Performance** - suggest optimizations where applicable
3. **Security** - flag any security concerns
4. **Readability** - suggest improvements for clarity and maintainability
5. **Best Practices** - recommend idiomatic patterns for the language

Be specific with line references and provide concrete suggestions.]],
            },
            {
              role = "user",
              content = "Please review the following code:\n\n```${filetype}\n${selection}\n```\n",
            },
          },
        },
        ["Explain Code"] = {
          strategy = "chat",
          description = "Explain how the selected code works",
          opts = {
            index = 2,
            is_default = true,
            is_slash_cmd = false,
            modes = { "v" },
            short_name = "explain",
            auto_submit = true,
          },
          prompts = {
            {
              role = "user",
              content = "Please explain how this code works in detail. Break down the logic step by step:\n\n```${filetype}\n${selection}\n```\n",
            },
          },
        },
        ["Write Tests"] = {
          strategy = "chat",
          description = "Generate unit tests for the selected code",
          opts = {
            index = 3,
            is_default = true,
            is_slash_cmd = false,
            modes = { "v" },
            short_name = "tests",
            auto_submit = true,
          },
          prompts = {
            {
              role = "system",
              content = [[You are an expert in writing tests. Generate comprehensive unit tests for the provided code. Include:
- Happy path tests
- Edge cases
- Error handling tests
- Use the testing framework that is standard for the language/project.]],
            },
            {
              role = "user",
              content = "Please write unit tests for this code:\n\n```${filetype}\n${selection}\n```\n",
            },
          },
        },
        ["Fix Code"] = {
          strategy = "chat",
          description = "Fix bugs or issues in the selected code",
          opts = {
            index = 4,
            is_default = true,
            is_slash_cmd = false,
            modes = { "v" },
            short_name = "fix",
            auto_submit = true,
          },
          prompts = {
            {
              role = "user",
              content = "There is a problem with this code. Please identify the issue and fix it:\n\n```${filetype}\n${selection}\n```\n",
            },
          },
        },
        ["Refactor"] = {
          strategy = "chat",
          description = "Refactor the selected code for better quality",
          opts = {
            index = 5,
            is_default = true,
            is_slash_cmd = false,
            modes = { "v" },
            short_name = "refactor",
            auto_submit = true,
          },
          prompts = {
            {
              role = "system",
              content = "Refactor the code to improve readability, maintainability, and performance while preserving the exact same behavior. Explain what you changed and why.",
            },
            {
              role = "user",
              content = "Please refactor this code:\n\n```${filetype}\n${selection}\n```\n",
            },
          },
        },
        ["Add Documentation"] = {
          strategy = "inline",
          description = "Add documentation comments to the selected code",
          opts = {
            index = 6,
            is_default = true,
            is_slash_cmd = false,
            modes = { "v" },
            short_name = "doc",
            auto_submit = true,
          },
          prompts = {
            {
              role = "user",
              content = "Add comprehensive documentation comments (docstrings, JSDoc, etc.) to this code. Use the appropriate documentation format for the language:\n\n```${filetype}\n${selection}\n```\n",
            },
          },
        },
        ["Commit Message"] = {
          strategy = "chat",
          description = "Generate a commit message for staged changes",
          opts = {
            index = 7,
            is_default = true,
            is_slash_cmd = true,
            short_name = "commit",
            auto_submit = true,
          },
          prompts = {
            {
              role = "user",
              content = function()
                return "Generate a concise, conventional commit message for the following staged changes. Use the format `type(scope): description`. Output ONLY the commit message, nothing else.\n\n```diff\n"
                  .. vim.fn.system("git diff --staged")
                  .. "\n```\n"
              end,
            },
          },
        },
      },

      -- ── Rules ───────────────────────────────────────────────────────
      rules = {
        default = {
          description = "Project rules",
          files = {
            ".cursorrules",
            ".clinerules",
            ".rules",
            "AGENT.md",
            "AGENTS.md",
            { path = "CLAUDE.md", parser = "claude" },
            { path = "CLAUDE.local.md", parser = "claude" },
          },
          is_preset = true,
        },
      },

      -- ── Global Options ──────────────────────────────────────────────
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

    -- 4. Keymap optimization
    require("which-key").add({
      -- Normal mode
      { "<leader>a", group = "AI (CodeCompanion)" },
      { "<leader><leader>", "<cmd>CodeCompanionChat toggle<cr>", desc = "Toggle AI Chat" },
      { "<leader>ac", "<cmd>CodeCompanionChat toggle<cr>", desc = "Toggle Chat" },
      { "<leader>aa", "<cmd>CodeCompanion<cr>", desc = "Inline Assistant" },
      { "<leader>ap", "<cmd>CodeCompanionActions<cr>", desc = "Action Palette" },
      { "<leader>ad", "<cmd>CodeCompanionDiff<cr>", desc = "Current Diff" },
      { "<leader>al", "<cmd>CodeCompanionChat diff<cr>", desc = "All Diffs" },
      { "<leader>as", "<cmd>CodeCompanionChat stop<cr>", desc = "Stop Generation" },
      { "<leader>ah", "<cmd>CodeCompanionHistory<cr>", desc = "Chat History" },

      -- Visual mode
      { "<leader>a", group = "AI (CodeCompanion)", mode = "v" },
      { "<leader>aa", ":CodeCompanion<cr>", desc = "Inline Assistant", mode = "v" },
      { "<leader>ac", ":CodeCompanionChat<cr>", desc = "Chat with Selection", mode = "v" },
      { "<leader>ae", ":CodeCompanion /explain<cr>", desc = "Explain Code", mode = "v" },
      { "<leader>ar", ":CodeCompanion /review<cr>", desc = "Review Code", mode = "v" },
      { "<leader>af", ":CodeCompanion /fix<cr>", desc = "Fix Code", mode = "v" },
      { "<leader>at", ":CodeCompanion /tests<cr>", desc = "Write Tests", mode = "v" },
      { "<leader>aR", ":CodeCompanion /refactor<cr>", desc = "Refactor Code", mode = "v" },
      { "<leader>ad", ":CodeCompanion /doc<cr>", desc = "Add Documentation", mode = "v" },
    })

    -- 5. Progress display with fidget.nvim
    local fidget_handles = {}
    local group = vim.api.nvim_create_augroup("CodeCompanionHooks", {})

    vim.api.nvim_create_autocmd("User", {
      pattern = "CodeCompanionRequestStarted",
      group = group,
      callback = function(request)
        local id = request.data.id
        fidget_handles[id] = require("fidget.progress").handle.create({
          title = " CodeCompanion",
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

    -- 6. Highlight groups
    vim.api.nvim_set_hl(0, "CodeCompanionChatHeader", { link = "Title", bold = true })
    vim.api.nvim_set_hl(0, "CodeCompanionChatSeparator", { link = "Comment" })
  end,
}
