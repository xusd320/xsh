return {
  {
    "neovim/nvim-lspconfig",
    opts = {
      capabilities = {
        textDocument = {
          foldingRange = {
            dynamicRegistration = false,
            lineFoldingOnly = true,
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
  },
}
