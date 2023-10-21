require('lvim.lsp.manager').setup('eslint', {
  on_attach = function(_, bufnr)
    vim.api.nvim_create_autocmd('BufWritePre', {
      buffer = bufnr,
      command = 'EslintFixAll',
    })
  end,
})

local formatters = require('lvim.lsp.null-ls.formatters')
formatters.setup({
  {
    command = 'prettier',
    fileTypes = { 'typescript', 'typescriptreact', 'javascript', 'javascriptreact', 'css', 'less', 'html' },
  },
})
