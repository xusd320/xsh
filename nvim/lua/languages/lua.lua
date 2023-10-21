local formatters = require('lvim.lsp.null-ls.formatters')
formatters.setup({
  {
    command = 'stylua',
    fileTypes = 'lua',
  },
})
