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
        root_dir = function()
          return vim.fn.getcwd()
        end,
      },
      servers = {},
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
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      -- UI: Style floating windows
      local border = "rounded"
      vim.lsp.handlers["textDocument/hover"] = vim.lsp.with(vim.lsp.handlers.hover, { border = border })
      vim.lsp.handlers["textDocument/signatureHelp"] = vim.lsp.with(vim.lsp.handlers.signature_help, { border = border })

      -- UI: Diagnostic signs and config
      local icons = {
        Error = " ",
        Warn = " ",
        Hint = " ",
        Info = " ",
      }
      for type, icon in pairs(icons) do
        local hl = "DiagnosticSign" .. type
        vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = "" })
      end

      vim.diagnostic.config({
        underline = true,
        update_in_insert = false,
        virtual_text = {
          spacing = 4,
          source = "if_many",
          prefix = "●",
        },
        severity_sort = true,
        float = {
          border = "rounded",
          source = "always",
        },
      })

      local function setup(server)
        local server_opts = vim.tbl_deep_extend("force", {
          capabilities = vim.deepcopy(capabilities),
        }, opts.defaults or {}, (opts.servers or {})[server] or {})
        lspconfig[server].setup(server_opts)
      end

      mason_lspconfig.setup({
        ensure_installed = vim.tbl_keys(opts.servers or {}),
        handlers = { setup },
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local buffer = args.buf
          local client = vim.lsp.get_client_by_id(args.data.client_id)
          local map = function(keys, func, desc, mode)
            vim.keymap.set(mode or "n", keys, func, { buffer = buffer, desc = desc })
          end

          -- Remove other non-gr default mappings if needed
          local del = vim.keymap.del
          pcall(del, "n", "gO", { buffer = buffer })
          pcall(del, "n", "<C-s>", { buffer = buffer })

          map("gd", "<cmd>Telescope lsp_definitions<cr>", "Goto Definition")
          map("gr", "<cmd>Telescope lsp_references<cr>", "References")
          map("gI", "<cmd>Telescope lsp_implementations<cr>", "Goto Implementation")
          map("gy", "<cmd>Telescope lsp_type_definitions<cr>", "Goto Type Definition")
          map("K", vim.lsp.buf.hover, "Hover")
          map("gK", vim.lsp.buf.signature_help, "Signature Help")
          map("<c-k>", vim.lsp.buf.signature_help, "Signature Help", "i")
          map("<leader>ca", vim.lsp.buf.code_action, "Code Action", { "n", "v" })
          map("<leader>cr", vim.lsp.buf.rename, "Rename")
          map("<leader>cf", function() vim.lsp.buf.format({ async = true }) end, "Format")

          -- Document Highlight (highlight references of symbol under cursor)
          if client and client.supports_method("textDocument/documentHighlight") then
            local highlight_augroup = vim.api.nvim_create_augroup("lsp_document_highlight_" .. buffer, { clear = true })
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
              group = highlight_augroup,
              buffer = buffer,
              callback = vim.lsp.buf.document_highlight,
            })
            vim.api.nvim_create_autocmd({ "CursorMoved", "CursorMovedI" }, {
              group = highlight_augroup,
              buffer = buffer,
              callback = vim.lsp.buf.clear_references,
            })
          end
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
