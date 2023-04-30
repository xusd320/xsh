lvim.lsp.installer.setup.ensure_installed = {
  "rust_analyzer",
  "tsserver",
  "eslint",
  "cssls",
  "stylelint_lsp",
  "lua_ls",
  "clangd",
  "bashls",
  "pyright",
  "cmake",
  "sqlls",
  "html",
  "taplo",
  "vimls",
  "jsonls",
  "yamlls",
}
lvim.lsp.installer.setup.automatic_installation = { exclude = { "tailwindcss", "vuels" } }
lvim.lsp.diagnostics.virtual_text = { source = true }

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    command = 'prettierd',
    fileTypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "css", "less", "html" }
  }
}
