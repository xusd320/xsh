local lsp_servers = {
  "rust_analyzer",
  "tsserver",
  "cssls",
  "stylelint_lsp",
  "sumneko_lua",
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
lvim.lsp.automatic_servers_installation = false
lvim.lsp.automatic_configuration.skipped_servers = vim.tbl_filter(function(server)
  return not vim.tbl_contains(lsp_servers, server)
end, require "mason-lspconfig".get_available_servers())
lvim.lsp.diagnostics.virtual_text = {
  source = true
}


require("lvim.lsp.manager").setup("eslint", {
  settings = {
    experimental = {
      useFlatConfig = false,
    },
    problems = {
      shortenToSingleLine = false,
    },
  },
})

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