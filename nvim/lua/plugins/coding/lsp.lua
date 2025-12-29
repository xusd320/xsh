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
          local map = function(keys, func, desc)
            vim.keymap.set("n", keys, func, { buffer = buffer, desc = desc })
          end
          
          map("gd", vim.lsp.buf.definition, "Goto Definition")
          map("gr", vim.lsp.buf.references, "References")
          map("gD", vim.lsp.buf.declaration, "Goto Declaration")
          map("gI", vim.lsp.buf.implementation, "Goto Implementation")
          map("gy", vim.lsp.buf.type_definition, "Goto Type Definition")
          map("K", vim.lsp.buf.hover, "Hover")
          map("gK", vim.lsp.buf.signature_help, "Signature Help")
          map("<leader>ca", vim.lsp.buf.code_action, "Code Action")
          map("<leader>cc", vim.lsp.codelens.run, "Run Codelens")
          map("<leader>cC", vim.lsp.codelens.refresh, "Refresh & Display Codelens")
          map("<leader>cl", "<cmd>LspInfo<cr>", "Lsp Info")
          map("<leader>cr", vim.lsp.buf.rename, "Rename")
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
        "rust-analyzer",
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

  -- LSP Progress
  {
    "j-hui/fidget.nvim",
    event = "LspAttach",
    opts = {
      notification = {
        window = {
          winblend = 0,
        },
      },
    },
  },
}
