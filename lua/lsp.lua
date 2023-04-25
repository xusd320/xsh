local lsp_servers = {
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
}
lvim.lsp.installer.setup.automatic_installation = true
lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
  return not vim.tbl_contains(lsp_servers, server)
end, require "mason-lspconfig".get_available_servers())

lvim.lsp.diagnostics.virtual_text = {
  source = true
}


require("lvim.lsp.manager").setup("eslint")

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    command = 'prettierd',
    fileTypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "css", "less", "html" }
  }
}

table.insert(lvim.builtin.cmp.sources, {
  name = "spell",
  option = {
    keep_all_entries = false,
    enable_in_context = function()
      return true
    end,
  },
})