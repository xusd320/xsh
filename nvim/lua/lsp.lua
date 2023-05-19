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
vim.diagnostic.config({ virtual_text = { source = true } })

require("lvim.lsp.manager").setup("eslint", {
  on_attach = function(_, bufnr)
    vim.api.nvim_create_autocmd("BufWritePre", {
      buffer = bufnr,
      command = "EslintFixAll",
    })
  end,
})

local formatters = require "lvim.lsp.null-ls.formatters"
formatters.setup {
  {
    command = "prettierd",
    fileTypes = { "typescript", "typescriptreact", "javascript", "javascriptreact", "css", "less", "html" }
  },
  {
    command = "fixjson",
    fileTypes = "json"
  }
}
