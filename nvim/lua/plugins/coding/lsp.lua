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
      local capabilities = require("blink.cmp").get_lsp_capabilities()

      local function setup(server)
        local server_opts = vim.tbl_deep_extend("force", {
          capabilities = vim.deepcopy(capabilities),
        }, opts.servers[server] or {})
        lspconfig[server].setup(server_opts)
      end

      mason_lspconfig.setup({
        ensure_installed = vim.tbl_keys(opts.servers or {}),
        handlers = { setup },
      })

      vim.api.nvim_create_autocmd("LspAttach", {
        callback = function(args)
          local buffer = args.buf
          local map = function(keys, func, desc, mode)
            vim.keymap.set(mode or "n", keys, func, { buffer = buffer, desc = desc })
          end

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
