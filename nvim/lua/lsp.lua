vim.diagnostic.config({ virtual_text = { source = true } })

vim.list_extend(lvim.lsp.installer.setup.ensure_installed, {
  'rust_analyzer',
  'tsserver',
  'eslint',
  'cssls',
  'stylelint_lsp',
  'lua_ls',
  'clangd',
  'bashls',
  'pyright',
  'cmake',
  'sqlls',
  'html',
  'taplo',
  'vimls',
  'jsonls',
  'yamlls',
})

vim.list_extend(lvim.lsp.automatic_configuration.skipped_servers, { 'rust_analyzer' })
lvim.lsp.automatic_configuration.skipped_filetypes = {}
