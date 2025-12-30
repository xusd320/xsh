return {
  -- LSP Configuration
  {
    "neovim/nvim-lspconfig",
    event = { "BufReadPre", "BufNewFile" },
    dependencies = {
      "williamboman/mason.nvim",
      "williamboman/mason-lspconfig.nvim",
      "saghen/blink.cmp",
    },
    opts = {
      -- Global capabilities/settings for all servers
      defaults = {
        capabilities = {
          textDocument = {
            foldingRange = {
              dynamicRegistration = false,
              lineFoldingOnly = true,
            },
          },
        },
      },
      document_highlight = {
        enabled = true,
      },
      inlay_hints = {
        enabled = false,
      },
    },
    config = function(_, opts)
      local lspconfig = require("lspconfig")
      local mason_lspconfig = require("mason-lspconfig")
      
      -- Capabilities
      local capabilities = require("blink.cmp").get_lsp_capabilities()
      capabilities = vim.tbl_deep_extend("force", capabilities, opts.defaults.capabilities or {})

      -- Setup Handler
      local function setup(server)
        local server_opts = opts.servers[server] or {}
        server_opts.capabilities = vim.tbl_deep_extend("force", capabilities, server_opts.capabilities or {})
        
        if lspconfig[server] then
          lspconfig[server].setup(server_opts)
        end
      end

      -- Setup Mason LSPConfig
      local ensure_installed = vim.tbl_keys(opts.servers or {})
      mason_lspconfig.setup({
        ensure_installed = ensure_installed,
        automatic_installation = false,
        handlers = { setup },
      })
      
      -- Keymaps
      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          local buffer = args.data.bufnr
          local map = function(keys, func, desc, mode)
            mode = mode or "n"
            vim.keymap.set(mode, keys, func, { buffer = buffer, desc = desc })
          end
          
          map("gd", function() require("telescope.builtin").lsp_definitions({ reuse_win = true }) end, "Goto Definition")
          map("gr", function() require("telescope.builtin").lsp_references() end, "References")
          map("gD", function() require("telescope.builtin").lsp_definitions({ reuse_win = true }) end, "Goto Declaration")
          map("gI", function() require("telescope.builtin").lsp_implementations({ reuse_win = true }) end, "Goto Implementation")
          map("gy", function() require("telescope.builtin").lsp_type_definitions({ reuse_win = true }) end, "Goto Type Definition")
          map("gci", function() require("telescope.builtin").lsp_incoming_calls() end, "Incoming Calls")
          map("gco", function() require("telescope.builtin").lsp_outgoing_calls() end, "Outgoing Calls")
          map("K", vim.lsp.buf.hover, "Hover")
          map("gK", vim.lsp.buf.signature_help, "Signature Help")
          map("<c-k>", vim.lsp.buf.signature_help, "Signature Help", "i")
          map("<leader>ca", vim.lsp.buf.code_action, "Code Action", { "n", "v" })
          map("<leader>cc", vim.lsp.codelens.run, "Run Codelens", { "n", "v" })
          map("<leader>cC", vim.lsp.codelens.refresh, "Refresh & Display Codelens")
          map("<leader>cl", "<cmd>LspInfo<cr>", "Lsp Info")
          map("<leader>cr", vim.lsp.buf.rename, "Rename")
          map("<leader>cA", function()
            vim.lsp.buf.code_action({
              context = {
                only = { "source" },
                diagnostics = {},
              },
            })
          end, "Source Action")
          map("<leader>cf", function() vim.lsp.buf.format({ async = true }) end, "Format")
        end,
      })
    end,
  },

  -- Mason (Tool Installer)
  {
    "mason-org/mason.nvim",
    keys = { { "<leader>cm", "<cmd>Mason<cr>", desc = "Mason" } },
    opts = {
      ensure_installed = {
        "bash-language-server",
        "biome",
        "codelldb",
        "css-lsp",
        "cssmodules-language-server",
        "dot-language-server",
        "eslint-lsp",
        "fixjson",
        "html-lsp",
        "js-debug-adapter",
        "json-lsp",
        "lua-language-server",
        "marksman",
        "prettier",
        "shfmt",
        "stylelint",
        "stylua",
        "taplo",
        "typos-lsp",
        "vim-language-server",
        "vtsls",
        "yaml-language-server",
      },
    },
  },
}
